{%- set source_model = "v_stg_product" -%}
{%- set src_pk = "PRODUCT_PK" -%}
{%- set src_hashdiff = "PRODUCT_HK" -%}
{%- set src_payload = ["PRODUCT_NAME", "PRODUCT_DESC"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LDTS" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}