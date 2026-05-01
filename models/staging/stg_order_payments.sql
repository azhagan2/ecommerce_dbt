WITH source AS (
    SELECT * FROM {{ source('bronze', 'olist_order_payments_dataset') }}
),

cleaned AS (
    SELECT
        "order_id" AS order_id,
        "payment_sequential" AS payment_sequential,
        "payment_type" AS payment_type,
        "payment_installments" AS payment_installments,
        "payment_value"::float AS payment_value
    FROM source
    WHERE "order_id" IS NOT NULL
)

SELECT * FROM cleaned