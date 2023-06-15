{%- set source_model = "v_stg_revenue" -%}
{%- set src_pk = "REVENUE_PK" -%}
{%- set src_hashdiff = "REVENUE_HK" -%}
{%- set src_payload = ["REVENUE_ID","ACCOUNT_ID","PRODUCT_ID","DATE","REVENUE_AMT_USD","REVENUE_AMT_LCL"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LDTS" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}