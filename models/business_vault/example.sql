{{ config(materialized='view') }}

with acc_hub AS(
    select ACCOUNT_PK from {{ ref('hub_account') }}
),
acc_link_revenue AS(
    select ACCOUNT_PK,REVENUE_PK from {{ ref('link_account_revenue') }}
),
revenue_hub AS (
    select REVENUE_PK from {{  ref('hub_revenue') }}
),
sat_account AS (
    select * from {{ ref('sat_account') }}
),
sat_revenue AS (
    select * from {{ ref('sat_revenue') }}
),
revenue_hub_account AS(
    select l1.REVENUE_PK,l1.ACCOUNT_PK from acc_hub h1
    LEFT JOIN acc_link_revenue l1
        ON h1.ACCOUNT_PK= l1.ACCOUNT_PK
    LEFT JOIN revenue_hub h2
        ON l1.REVENUE_PK=h2.REVENUE_PK
)
select ACCOUNT_NAME,REVENUE_AMT_USD,REVENUE_AMT_LCL,SOURCE_ACCOUNT_ID,DATE FROM revenue_hub_account ra
LEFT JOIN sat_account sa
ON ra.ACCOUNT_PK= sa.ACCOUNT_PK
LEFT JOIN sat_revenue sr
ON ra.REVENUE_PK = sr.REVENUE_PK