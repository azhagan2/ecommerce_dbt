WITH source AS (
    SELECT * FROM {{ source('bronze', 'olist_order_reviews_dataset') }}
),

cleaned AS (
    SELECT
        "review_id" AS review_id,
        "order_id" AS order_id,
        "review_score"::int AS review_score,
        "review_comment_title" AS comment_title,
        "review_comment_message" AS comment_message,
        "review_creation_date"::timestamp AS reviewed_at
    FROM source
    WHERE "review_id" IS NOT NULL
)

SELECT * FROM cleaned