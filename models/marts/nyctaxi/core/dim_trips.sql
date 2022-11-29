{{
    config(
        materialized='table',
        catalog='luis_leon_workspace',
        grants = {'select': 'luis.leon@dbtlabs.com'}
        
    )
}}

with trips as (

    select * from {{ref('stg_nyctaxi_trips')}}

),

final as (
    select 
        pickup_time,
        dropoff_time,
        datediff(minute,pickup_time,dropoff_time) as trip_duration_minutes,
        trip_distance,
        trip_distance * (60/(datediff(minute,pickup_time,dropoff_time))) as average_mph,
        fare_amount,
        pickup_zip,
        dropoff_zip

    from
        trips
)
select *
from final  