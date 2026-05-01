WITH products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

category AS (
    SELECT * FROM {{ ref('stg_product_category') }}
),

final AS (
    SELECT
        p.product_id,
        COALESCE(c.category_name_english, 'unknown') AS category_name,
        p.weight_g,
        p.length_cm,
        p.height_cm,
        p.width_cm
    FROM products p
    LEFT JOIN category c ON p.category_name = c.category_name
)

SELECT * FROM final