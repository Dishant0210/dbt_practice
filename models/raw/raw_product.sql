{{
    config(
        materialized='table'
    )
}}

select * from raw.global_mart.product