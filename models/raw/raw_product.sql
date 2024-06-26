{{
    config(
        materialized='table'
    )
}}

select * from {{ source('global_mart','product') }}