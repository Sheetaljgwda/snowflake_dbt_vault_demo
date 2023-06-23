{{ config(materialized='view') }}

WITH link_o_r AS(
    select * from {{ ref('link_account_revenue')}}
)

select l.ACCOUNT_PK as ACCOUNT_ID,l.REVENUE_PK as REVENUE_ID,l.LDTS,l.RECORD_SOURCE
from link_o_r as l