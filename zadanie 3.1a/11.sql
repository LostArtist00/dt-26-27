CREATE OR REPLACE PROCEDURE get_sales_between(
    start_date DATE,
    end_date DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_total_sales NUMERIC(12,2);
BEGIN
    SELECT COALESCE(SUM(sales), 0)
    INTO v_total_sales
    FROM orders
    WHERE order_date BETWEEN start_date AND end_date;

    RAISE NOTICE 'Period: % to %, Total sales: %',
        start_date, end_date, v_total_sales;
END;
$$;

SELECT COALESCE(SUM(sales), 0) AS total_sales
FROM orders
WHERE order_date BETWEEN DATE '2024-01-01' AND DATE '2024-03-31';