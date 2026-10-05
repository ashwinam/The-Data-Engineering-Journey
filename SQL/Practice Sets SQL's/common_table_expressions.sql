/* PROJECT */

-- STEP 1: FIND THE TOTAL SALES PER CUSTOMER
WITH CTE_sales_per_customer AS
(
	SELECT 
		customerid,
		SUM(sales) total_sales
	FROM orders
	GROUP BY customerid
)
-- STEP 2: FIND THE LAST ORDER DATE PER CUSTOMER
, CTE_last_order AS
(
SELECT 
	customerid,
    MAX(orderdate) AS last_order_date
FROM orders
GROUP BY customerid
)
-- STEP 3: RANK CUSTOMERS BASED ON TOTAL SALES PER CUSTOMERS
, CTE_customer_rank AS
(
SELECT
	customerid,
    total_sales,
    RANK() OVER(ORDER BY total_sales DESC) AS customer_rank
FROM CTE_sales_per_customer
)
-- STEP 4: SEGMENT CUSTOMERS BASED ON THEIR TOTAL SALES
, CTE_customer_segments AS
(
SELECT 
	customerid, 
    CASE
		WHEN total_sales > 100 THEN 'High'
        WHEN total_sales > 50 THEN 'Medium'
        ELSE 'Low'
	END AS customer_segments
FROM CTE_sales_per_customer
)
-- MAIN QUERY
SELECT 
	c.customerid,
    c.firstname,
    c.lastname,
    csc.total_sales,
    clo.last_order_date,
    ccr.customer_rank,
    ccs.customer_segments
FROM customers c
LEFT JOIN CTE_sales_per_customer csc
	ON csc.customerid = c.customerid
LEFT JOIN CTE_last_order clo
	ON clo.customerid = c.customerid
LEFT JOIN CTE_customer_rank ccr
	ON ccr.customerid = c.customerid
LEFT JOIN CTE_customer_segments ccs
	ON ccs.customerid = c.customerid
ORDER BY csc.total_sales DESC;	


-- RECURSIVE QUERY
-- GENERATE A SEQUENCE OF NUMBERS FROM 1 TO 20

WITH RECURSIVE CTE_series AS
(
-- Anchor Query
SELECT
	1 AS my_number

UNION ALL
-- Recursive Query
SELECT 
	my_number + 1
FROM CTE_series
WHERE my_number < 20
)
-- MAIN QUERY
SELECT
	*
FROM CTE_series;