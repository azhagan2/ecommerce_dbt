WITH source AS (
    SELECT * FROM {{ source('bronze', 'olist_sellers_dataset') }}
),

cleaned AS (
    SELECT
        "seller_id" as seller_id,
        "seller_zip_code_prefix" AS zip_code,
        "seller_city" AS city,
        "seller_state" AS state
    FROM source
    WHERE "seller_id" IS NOT NULL
)

SELECT * FROM cleaned