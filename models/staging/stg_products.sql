WITH source AS (
    SELECT * FROM {{ source('bronze', 'olist_products_dataset') }}
),

cleaned AS (
    SELECT
        "product_id" AS product_id,
        "product_category_name" AS category_name,
        "product_weight_g"::float AS weight_g,
        "product_length_cm"::float AS length_cm,
        "product_height_cm"::float AS height_cm,
        "product_width_cm"::float AS width_cm
    FROM source
    WHERE "product_id" IS NOT NULL
)

SELECT * FROM cleaned