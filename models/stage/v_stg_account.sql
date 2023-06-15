{%- set yaml_metadata -%}
source_model: 'account_stage'
derived_columns:
  RECORD_SOURCE: '!ACCOUNT_STAGE'
hashed_columns:
  ACCOUNT_PK: 'ACCOUNT_ID'
  ACCOUNT_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'ACCOUNT_NAME'

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ automate_dv.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}