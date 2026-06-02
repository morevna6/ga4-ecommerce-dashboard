create or replace view `autonomous-rite-460417-h4.goit_project_1.ga4_ecommerce_dashboard` AS

with events as (
  select
    parse_date('%Y%m%d', event_date) as session_date,
    timestamp_micros(event_timestamp) as event_timestamp,
    event_name,
    user_pseudo_id,

    concat(
      user_pseudo_id,
      '-',
      cast((
        select value.int_value
        from unnest(event_params)
        where key = 'ga_session_id'
      ) as string)
    ) as session_id,

    (
      select value.string_value
      from unnest(event_params)
      where key = 'page_location'
    ) as page_location,

    (
      select value.string_value
      from unnest(event_params)
      where key = 'source'
    ) as source,

    (
      select value.string_value
      from unnest(event_params)
      where key = 'medium'
    ) as medium,

    (
      select value.string_value
      from unnest(event_params)
      where key = 'campaign'
    ) as campaign,

    device.category as device_category,
    device.language as device_language,
    device.operating_system as operating_system,

    ecommerce.purchase_revenue as purchase_revenue,
    ecommerce.transaction_id as transaction_id

  from `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  where _TABLE_SUFFIX between '20201101' and '20210131'
),

session_base as (
  select
    session_id,
    user_pseudo_id,

    min(session_date) as session_date,
    min(event_timestamp) as session_start_time,

    array_agg(page_location ignore nulls order by event_timestamp limit 1)[safe_offset(0)] as landing_page,

    coalesce(
      array_agg(source ignore nulls order by event_timestamp limit 1)[safe_offset(0)],
      '(direct)'
    ) as source,

    coalesce(
      array_agg(medium ignore nulls order by event_timestamp LIMIT 1)[safe_offset(0)],
      '(none)'
    ) as medium,

    coalesce(
      array_agg(campaign ignore nulls order by event_timestamp limit 1)[safe_offset(0)],
      '(not set)'
    ) as campaign,

    array_agg(device_category ignore nulls order by event_timestamp limit 1)[safe_offset(0)] as device_category,
    array_agg(device_language ignore nulls order by event_timestamp limit 1)[safe_offset(0)] as device_language,
    array_agg(operating_system ignore nulls order by event_timestamp limit 1)[safe_offset(0)] as operating_system,

    max(case when event_name = 'session_start' then 1 else 0 end) as session_start,
    max(case when event_name = 'view_item' then 1 else 0 end) as view_item,
    max(case when event_name = 'add_to_cart' then 1 else 0 end) as add_to_cart,
    max(case when event_name = 'begin_checkout' then 1 else 0 end) as begin_checkout,
    max(case when event_name = 'add_shipping_info' then 1 else 0 end) as add_shipping_info,
    max(case when event_name = 'add_payment_info' then 1 else 0 end) as add_payment_info,
    max(case when event_name = 'purchase' then 1 else 0 end) as purchase,

    countif(event_name = 'purchase') as purchase_events,
    count(distinct transaction_id) as transactions,
    sum(coalesce(purchase_revenue, 0)) as revenue

  from events
  where session_id is not null
  group by
    session_id,
    user_pseudo_id
)

select
  session_date,
  session_start_time,
  session_id,
  user_pseudo_id,

  landing_page,
  source,
  medium,
  campaign,
  concat(source, ' / ', medium) as source_medium,

  device_category,
  device_language,
  operating_system,

  session_start,
  view_item,
  add_to_cart,
  begin_checkout,
  add_shipping_info,
  add_payment_info,
  purchase,

  1 as sessions,
  purchase_events,
  transactions,
  revenue

from session_base;