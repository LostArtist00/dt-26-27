-- Active: 1790163439668@@127.0.0.1@5432@retail
WITH monthly_sales AS(
    SELECT
    country,
    date_trunc('month',invoice_date)::date AS month,
    SUM(quantity * unit_price) AS total_amount
    FROM retail_sales
    GROUP BY country, DATE_TRUNC('month',invoice_date)
),
sales_quartile AS (
    SELECT
    country,
    month,
    total_amount,
    NTILE(4) OVER(
        PARTITION BY country
        ORDER BY total_amount DESC
    )AS sales_quartile
    FROM monthly_sales
)
SELECT
country,
month,
total_amount,
sales_quartile
FROM sales_quartile
ORDER BY country ASC , month;