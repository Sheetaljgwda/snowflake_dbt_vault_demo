{%- set source_model = "v_stg_account"   -%}
{%- set src_pk = "ACCOUNT_PK"          -%}
{%- set src_nk = ["ACCOUNT_ID","SOURCE_ACCOUNT_ID"]          -%}
{%- set src_ldts = "LDTS"      -%}
{%- set src_source = "RECORD_SOURCE"    -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}