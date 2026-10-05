-- FIND THE RUNNING TOTAL OF SALES FOR EACH MONTH
-- WITH CTE
WITH cte_monthly_total_sales AS
(
SELECT
	DATE_FORMAT(orderdate, '%Y-%m-01') AS ordermonth,
    SUM(sales) AS total_sales
FROM orders
GROUP BY DATE_FORMAT(orderdate, '%Y-%m-01')
)
SELECT
	ordermonth,
    total_sales,
    SUM(total_sales) OVER(ORDER BY ordermonth) AS running_total
FROM cte_monthly_total_sales;

-- CREATE VIEW FOR CTE

CREATE OR REPLACE VIEW v_monthly_sales AS 
(
	SELECT
	DATE_FORMAT(orderdate, '%Y-%m-01') AS ordermonth,
    SUM(sales) AS total_sales,
    COUNT(orderid) AS order_count
FROM orders
GROUP BY DATE_FORMAT(orderdate, '%Y-%m-01')
);

-- QUERY FROM VIEW

SELECT
	ordermonth,
    total_sales,
    SUM(total_sales) OVER(ORDER BY ordermonth) AS running_total
FROM v_monthly_sales;