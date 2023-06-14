select raw_json:product_id::NUMBER  product_id,
       raw_json:product_name::STRING  product_name,
       raw_json:description::STRING product_desc,
       FILENAME,
       FILE_ROW_SEQ,
       LDTS,
       TO_DATE('{{var('effective_from')}}') EFFECTIVE_FROM
FROM {{ source('dbt_testing','product')}}