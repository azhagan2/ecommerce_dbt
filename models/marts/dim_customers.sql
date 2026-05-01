WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),

orders AS (
    SELECT
        customer_id,
        MIN(ordered_at) AS first_order_at,
        MAX(ordered_at) AS last_order_at,
        COUNT(order_id) AS total_orders
    FROM {{ ref('stg_orders') }}
    GROUP BY customer_id
),

final AS (
    SELECT
        c.customer_id,
        c.customer_unique_id,
        c.city,
        c.state,
        o.first_order_at,
        o.last_order_at,
        o.total_orders,
        CASE
            WHEN o.total_orders = 1 THEN 'new'
            WHEN o.total_orders BETWEEN 2 AND 4 THEN 'returning'
            ELSE 'loyal'
        END AS customer_segment
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
)

SELECT * FROM final