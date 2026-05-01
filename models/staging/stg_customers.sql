WITH source AS (
    SELECT * FROM {{ source('bronze', 'olist_customers_dataset') }}
),

cleaned AS (
    SELECT
        "customer_id" AS customer_id,
        "customer_unique_id" AS customer_unique_id,
        "customer_zip_code_prefix" AS zip_code,
        "customer_city" AS city,
        "customer_state" AS state
    FROM source
    WHERE "customer_id" IS NOT NULL
)

SELECT * FROM cleaned