CREATE VIEW analyst_orders AS
SELECT
    order_id,
    customer_id,
    product_id,S
    sales,
    quantity,
    discount
FROM orders;

SELECT * FROM analyst_orders;