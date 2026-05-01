WITH source AS (
    SELECT * FROM {{ source('bronze', 'product_category_name_translation') }}
),

cleaned AS (
    SELECT
        "product_category_name" AS category_name,
        "product_category_name_english" AS category_name_english
    FROM source
    WHERE "product_category_name" IS NOT NULL
)

SELECT * FROM cleaned