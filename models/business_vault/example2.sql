{{ config(materialized='view')}}

with hub_product AS(
    select PRODUCT_PK from {{ ref('hub_product') }}
),
sat_product AS (
    select * from {{ ref('sat_product') }}
),
hs_product as(
    select hub.PRODUCT_PK,sat.PRODUCT_ID,sat.PRODUCT_NAME,sat.PRODUCT_DESC,sat.EFFECTIVE_FROM,sat.RECORD_SOURCE,sat.LDTS from sat_product sat, hub_product hub
where hub.product_pk= sat.product_pk
),
hub_revenue AS (
    select REVENUE_PK from {{  ref('hub_revenue') }}
),
sat_revenue AS (
    select * from {{ ref('sat_revenue') }}
),
hs_revenue AS(
    select hr.REVENUE_PK,sr.revenue_id ,sr.product_id ,sr.account_id ,sr.revenue_amt_usd,sr.revenue_amt_lcl,sr.date,sr.ldts
    from sat_revenue sr, hub_revenue hr
    where hr.REVENUE_PK = sr.REVENUE_PK
),
prod_link_revenue AS(
    select REVENUE_PK,PRODUCT_PK from {{ ref('link_product_revenue')}}
)
select ph.PRODUCT_ID,rh.REVENUE_ID,ph.PRODUCT_NAME,ph.PRODUCT_DESC,rh.REVENUE_AMT_USD,rh.REVENUE_AMT_LCL,ph.EFFECTIVE_FROM,ph.RECORD_SOURCE,ph.LDTS,rh.DATE 
FROM hs_product ph
    LEFT JOIN prod_link_revenue l
    ON ph.PRODUCT_PK = l.PRODUCT_PK
    LEFT JOIN hs_revenue rh
    ON l.REVENUE_PK = rh.REVENUE_PK
    

