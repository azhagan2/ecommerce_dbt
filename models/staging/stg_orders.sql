WITH source AS (
    SELECT * FROM {{ source('bronze', 'olist_orders_dataset') }}
),

cleaned AS (
    SELECT
        "order_id" as ORDER_ID,
        "customer_id" as CUSTOMER_ID,
        "order_status" as ORDER_STATUS,
        "order_purchase_timestamp"::timestamp AS ORDERED_AT,
        "order_approved_at"::timestamp AS APPROVED_AT,
        "order_delivered_carrier_date"::timestamp AS SHIPPED_AT,
        "order_delivered_customer_date"::timestamp AS DELIVERED_AT,
        "order_estimated_delivery_date"::timestamp AS ESTIMATED_DELIVERY_AT
    FROM source
    WHERE "order_id" IS NOT NULL
)

SELECT * FROM cleaned