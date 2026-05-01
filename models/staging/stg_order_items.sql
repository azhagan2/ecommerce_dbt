WITH source AS (
    SELECT * FROM {{ source('bronze', 'olist_order_items_dataset') }}
),

cleaned AS (
    SELECT
        "order_id" AS order_id,
        "order_item_id" AS order_item_id,
        "product_id" AS product_id,
        "seller_id" AS seller_id,
        "shipping_limit_date"::timestamp AS shipping_limit_at,
        "price"::float AS price,
        "freight_value"::float AS freight_value
    FROM source
    WHERE "order_id" IS NOT NULL
)

SELECT * FROM cleaned