{{
  config(
    materialized = 'ephemeral'
    )
}}

WITH listings as 
( SELECT LISTING_ID,
         PROPERTY_TYPE,
         CITY,
         ROOM_TYPE,
         BEDROOMS,
         ACCOMMODATES,
         LISTINGS_CREATED_AT,
FROM {{ ref('obt') }}
) SELECT * FROM listings