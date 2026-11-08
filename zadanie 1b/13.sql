SELECT *
FROM flourmills_sales s
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales s2
    WHERE s2.region = s.region
      AND EXTRACT(YEAR FROM s2.sale_date) = 2024
);