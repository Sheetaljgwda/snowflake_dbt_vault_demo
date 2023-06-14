
select *, TO_DATE('{{var('effective_from')}}') EFFECTIVE_FROM from {{ source('dbt_testing', 'revenue') }}