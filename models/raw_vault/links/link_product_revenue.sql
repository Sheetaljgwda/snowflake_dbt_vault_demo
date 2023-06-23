{%- set source_model = "v_stg_revenue" -%}
{%- set src_pk = "LINK_PRODUCT_REVENUE_PK" -%}
{%- set src_fk = ["PRODUCT_PK", "REVENUE_PK"] -%}
{%- set src_ldts = "LDTS" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}
