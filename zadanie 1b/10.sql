SELECT *
FROM flourmills_sales s
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales s2
    WHERE s2.product_name = s.product_name
    GROUP BY s2.product_name
    HAVING COUNT(DISTINCT EXTRACT(MONTH FROM s2.sale_date)) > 1
);