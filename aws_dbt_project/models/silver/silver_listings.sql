{{ config(materialized = 'incremental', unique_key = 'listing_id') }}

SELECT
  LISTING_ID,
  HOST_ID,
  PROPERTY_TYPE,
  ROOM_TYPE,
  CITY,
  ACCOMMODATES,
  BEDROOMS,
  BATHROOMS,
  PRICE_PER_NIGHT,
  {{ tag('PRICE_PER_NIGHT') }} AS price_category,
  CREATED_AT
FROM {{ ref('bronze_listings') }}