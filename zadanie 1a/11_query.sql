SELECT
    customers.region,
    SUM(orders.sales) AS total_sales,
    AVG(orders.discount) AS average_discount,
    COUNT(orders.order_id) AS order_count
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.region;