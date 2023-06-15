{{ config(materialized='view') }}

with product_hub AS(
    select PRODUCT_PK from {{ ref('hub_product') }}
),

sat_product AS (
    select * from {{ ref('sat_product') }}
)

select hub.PRODUCT_PK,sat.PRODUCT_ID,sat.PRODUCT_NAME,sat.PRODUCT_DESC,sat.EFFECTIVE_FROM,sat.RECORD_SOURCE,sat.LDTS from sat_product sat, product_hub hub
where hub.product_pk= sat.product_pk