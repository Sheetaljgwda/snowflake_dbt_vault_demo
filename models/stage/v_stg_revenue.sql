{%- set yaml_metadata -%}
source_model: 'revenue_stage'
derived_columns:
  RECORD_SOURCE: '!REVENUE_STAGE'
hashed_columns:
  REVENUE_PK: 'REVENUE_ID'
  PRODUCT_PK: 'PRODUCT_ID'
  ACCOUNT_PK: 'ACCOUNT_ID'
  LINK_PRODUCT_REVENUE_PK:
    - 'PRODUCT_ID'
    - 'REVENUE_ID'
  LINK_ACCOUNT_REVENUE_PK:
    - 'ACCOUNT_ID'
    - 'REVENUE_ID'
  REVENUE_HK:
    is_hashdiff: true
    columns:
        - 'REVENUE_ID'
        - 'REVENUE_AMT_USD'
        - 'REVENUE_AMT_LCL'
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