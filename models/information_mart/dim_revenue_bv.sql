{{config(materialized='view')}}

with sat_revenue AS(
    select * from {{ ref('sat_revenue') }}
),
hub_revenue AS(
    select REVENUE_PK from {{ ref('hub_revenue') }}
)

select hr.REVENUE_PK,sr.revenue_id ,sr.product_id ,sr.account_id ,sr.revenue_amt_usd,sr.revenue_amt_lcl,sr.date,sr.ldts,
CASE
    WHEN revenue_amt_usd<550 THEN 'LOW'
    WHEN revenue_amt_usd>550 AND revenue_amt_usd<650 THEN 'MID'
    WHEN revenue_amt_usd>650 THEN 'HIGH'
    END AS REVENUE_RANK
from sat_revenue sr, hub_revenue hr
where hr.REVENUE_PK = sr.REVENUE_PK