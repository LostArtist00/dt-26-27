SELECT product_category, product_name, total_amount
FROM flourmills_sales s
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales s2
    WHERE s2.product_category = s.product_category
      AND s2.total_amount > 200000
);