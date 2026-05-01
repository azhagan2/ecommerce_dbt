WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),

order_payments AS (
    SELECT * FROM {{ ref('stg_order_payments') }}
),

order_reviews AS (
    SELECT * FROM {{ ref('stg_order_reviews') }}
),

final AS (
    SELECT
        o.order_id,
        o.customer_id,
        oi.product_id,
        oi.seller_id,
        o.order_status,
        o.ordered_at,
        o.approved_at,
        o.shipped_at,
        o.delivered_at,
        o.estimated_delivery_at,
        oi.price,
        oi.freight_value,
        oi.price + oi.freight_value AS total_amount,
        op.payment_type,
        op.payment_installments,
        op.payment_value,
        r.review_score
    FROM orders o
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    LEFT JOIN order_payments op ON o.order_id = op.order_id
    LEFT JOIN order_reviews r ON o.order_id = r.order_id
    WHERE oi.price IS NOT NULL
)

SELECT * FROM final