{%- set source_model = "v_stg_revenue"   -%}
{%- set src_pk = "REVENUE_PK"          -%}
{%- set src_nk = "REVENUE_HK"         -%}
{%- set src_ldts = "LDTS"      -%}
{%- set src_source = "RECORD_SOURCE"    -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}