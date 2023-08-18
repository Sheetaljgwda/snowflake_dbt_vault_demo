{{ config(materialized='view') }}

WITH link_o_r AS(
    select * from {{ ref('link_product_revenue')}}
)

select l.PRODUCT_PK as PRODUCT_ID,l.REVENUE_PK as REVENUE_ID,l.LDTS,l.RECORD_SOURCE
from link_o_r as l