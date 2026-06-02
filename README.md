# GA4 E-commerce Performance Dashboard

Interactive GA4 e-commerce performance dashboard built with **BigQuery SQL** and **Looker Studio** using the public GA4 sample e-commerce dataset.

This project transforms raw GA4 event-level data into clean, dashboard-ready SQL views and visualizes key e-commerce metrics such as sessions, purchases, revenue, conversion funnel behavior, landing page performance, traffic source performance, and device-based conversion rates.

---

## Author

**Günışığı Aydoğan**

[LinkedIn](https://www.linkedin.com/in/gunisigiaydogan/)

---

## Live Dashboard

You can view the interactive Looker Studio dashboard here:

[View the Live Dashboard](https://datastudio.google.com/u/0/reporting/abf5bc46-887a-4901-939e-80cdeab1046b/page/7FrzF)

---

## Dashboard Preview

![Dashboard Overview](dashboard/project_last_-_Günışığı_Aydoğan.pdf)

The dashboard provides an interactive overview of GA4 e-commerce performance. It includes KPI cards, funnel analysis, time series charts, revenue analysis, landing page performance, device conversion insights, and interactive filters.

---

## Project Overview

The goal of this project was to create an interactive e-commerce dashboard using SQL-transformed data from BigQuery.

Raw GA4 event-level data was transformed into session-level and funnel-level SQL views, then connected to Looker Studio for visualization and analysis.

The dashboard includes:

- Total Sessions
- Total Purchases
- Total Revenue
- Conversion Rate
- Average Order Value
- E-commerce Conversion Funnel
- Sessions and Purchases Over Time
- Revenue Over Time
- Revenue by Source / Medium
- Top Landing Pages by Sessions
- Conversion Rate by Device Category
- Interactive filters

---

## Tools Used

- BigQuery
- SQL
- Looker Studio
- GA4 Public E-commerce Dataset
- GitHub

---

## Dataset

This project uses the public GA4 sample e-commerce dataset available in BigQuery:

```text
bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*
