{{ config(materialized='view') }}

with acc_hub AS(
    select ACCOUNT_PK from {{ ref('hub_account') }}
),

sat_account AS (
    select * from {{ ref('sat_account') }}
)

select hub.ACCOUNT_PK,sat.ACCOUNT_ID,sat.ACCOUNT_NAME,sat.SOURCE_ACCOUNT_ID,sat.EFFECTIVE_FROM,sat.RECORD_SOURCE,sat.LDTS from sat_account sat, acc_hub hub
where hub.account_pk= sat.ACCOUNT_PK