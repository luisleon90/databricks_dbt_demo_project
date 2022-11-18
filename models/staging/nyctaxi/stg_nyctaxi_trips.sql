{{
    config(
        materialized='table',
        catalog='luis_leon_workspace'
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
        dropoff_zip as dropoff_zip

    from source

)

select * from renamed