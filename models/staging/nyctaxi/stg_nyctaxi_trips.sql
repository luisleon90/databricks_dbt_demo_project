{{
    config(
        materialized='table'
            )
}}

with source as (

    select * from {{ source('nyctaxi', 'trips') }}

),

renamed as (

    select
    
        tpep_pickup_datetime as pickup_time,
        tpep_dropoff_datetime as dropoff_time,
        trip_distance as trip_distance,
        fare_amount as fare_amount,
        pickup_zip as pickup_zip,
        dropoff_zip as dropoff_zip,
        0 as new_col,
        1 as good_data,
        2 as good_data_fixed

    from source

)

select * from renamed