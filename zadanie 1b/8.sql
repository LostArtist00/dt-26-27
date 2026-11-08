SELECT s.product_name,
       s.product_category,
       s.total_amount
FROM flourmills_sales s
WHERE s.total_amount > (
    SELECT AVG(s2.total_amount)
    FROM flourmills_sales s2
    WHERE s2.product_category = s.product_category
);

SELECT COUNT(*)
FROM flourmills_sales s
WHERE s.total_amount > (
    SELECT AVG(s2.total_amount)
    FROM flourmills_sales s2
    WHERE s2.product_category = s.product_category
);