WITH sellers AS (
    SELECT * FROM {{ ref('stg_sellers') }}
),

final AS (
    SELECT
        seller_id,
        city,
        state,
        zip_code
    FROM sellers
)

SELECT * FROM final