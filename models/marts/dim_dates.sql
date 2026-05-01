WITH date_spine AS (
    SELECT
        DATEADD(day, seq4(), '2016-01-01'::date) AS date_day
    FROM TABLE(GENERATOR(ROWCOUNT => 2000))
),

final AS (
    SELECT
        date_day AS date_id,
        YEAR(date_day) AS year,
        MONTH(date_day) AS month,
        DAY(date_day) AS day,
        DAYOFWEEK(date_day) AS day_of_week,
        DAYNAME(date_day) AS day_name,
        MONTHNAME(date_day) AS month_name,
        QUARTER(date_day) AS quarter,
        CASE WHEN DAYOFWEEK(date_day) IN (1,7) THEN TRUE ELSE FALSE END AS is_weekend
    FROM date_spine
)

SELECT * FROM final