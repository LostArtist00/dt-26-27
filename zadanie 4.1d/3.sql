WITH customer_sales AS (
    SELECT
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
),
sales_quartiles AS (
    SELECT
        customer_name,
        total_sales,
        NTILE(4) OVER (
            ORDER BY total_sales DESC
        ) AS quartile
    FROM customer_sales
)
SELECT *
FROM sales_quartiles
WHERE customer_name = 'Customer_26';