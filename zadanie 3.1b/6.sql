WITH RECURSIVE date_range AS (
    SELECT MIN(sale_date) AS start_date,
           MAX(sale_date) AS end_date
    FROM flourmills_sales
),
calendar AS (
    SELECT start_date AS sale_date, end_date
    FROM date_range

    UNION ALL

    SELECT sale_date + 1, end_date
    FROM calendar
    WHERE sale_date < end_date
)
SELECT COUNT(*)
FROM calendar;