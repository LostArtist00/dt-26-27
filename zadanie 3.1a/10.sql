CREATE OR REPLACE PROCEDURE apply_regional_discount(
    region_name VARCHAR(20),
    discount_rate NUMERIC
)
LANGUAGE plpgsql
AS $procedure$
BEGIN
UPDATE orders
SET sales = sales * (1 - discount_rate)
FROM customers
WHERE orders.customer_id = customers.customer_id
AND customers.region = region_name;

RAISE NOTICE 'Discount of % applied to region %',
    discount_rate * 100, region_name;
END;
$procedure$;

