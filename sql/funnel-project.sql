create or replace view `autonomous-rite-460417-h4.goit_project_1.ga4_ecommerce_funnel` AS

select
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system,
  '1. Session Start' as funnel_step,
  1 as step_order,
  sum(session_start) as sessions
from `autonomous-rite-460417-h4.goit_project_1.ga4_ecommerce_dashboard`
group by
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system

union all

select
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system,
  '2. View Item' as funnel_step,
  2 as step_order,
  sum(view_item) as sessions
from `autonomous-rite-460417-h4.goit_project_1.ga4_ecommerce_dashboard`
group by
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system

union all

select
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system,
  '3. Add to Cart' as funnel_step,
  3 as step_order,
  sum(add_to_cart) as sessions
from `autonomous-rite-460417-h4.goit_project_1.ga4_ecommerce_dashboard`
group by
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system

union all

select
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system,
  '4. Begin Checkout' as funnel_step,
  4 as step_order,
  sum(begin_checkout) as sessions
from `autonomous-rite-460417-h4.goit_project_1.ga4_ecommerce_dashboard`
group by
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system

union all

select
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system,
  '5. Add Shipping Info' as funnel_step,
  5 as step_order,
  sum(add_shipping_info) as sessions
from `autonomous-rite-460417-h4.goit_project_1.ga4_ecommerce_dashboard`
group by
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system

union all

select
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system,
  '6. Add Payment Info' as funnel_step,
  6 as step_order,
  sum(add_payment_info) as sessions
from `autonomous-rite-460417-h4.goit_project_1.ga4_ecommerce_dashboard`
group by
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system

union all

select
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system,
  '7. Purchase' as funnel_step,
  7 as step_order,
  sum(purchase) as sessions
from `autonomous-rite-460417-h4.goit_project_1.ga4_ecommerce_dashboard`
group by
  session_date,
  session_start_time,
  landing_page,
  source,
  medium,
  campaign,
  source_medium,
  device_category,
  device_language,
  operating_system;
