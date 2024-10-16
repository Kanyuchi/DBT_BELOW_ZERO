{{ config(materialized='view') }}

WITH flights_two_months AS (
    SELECT * 
    FROM {{source('staging_flights', 'flights')}}
    WHERE DATE_PART('month', flight_date) IN (1, 2) 
    AND origin IN ('ORD', 'MSP', 'DTW', 'MKE', 'CLE')
    AND dest IN ('ORD', 'MSP', 'DTW', 'MKE', 'CLE')
)
SELECT * FROM flights_two_months
