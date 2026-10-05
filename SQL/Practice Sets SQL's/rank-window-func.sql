-- RANK THE ORDERS BASED ON THEIR SALES FROM HIGHEST TO LOWEST

SELECT 
	orderid,
    sales,
    ROW_NUMBER() OVER(ORDER BY sales DESC) rank_orders
FROM orders;

-- FIND THE TOP HIGHEST SALES FOR EACH PRODUCT
	-- RANK THE SALES BASED ON PRODUCTS
    -- USE THE WINDOW FUNCTIONS FOR PARTITION AND ORDER BY FOR RANK
    -- GET ONLY FIRST ROWS BECAUSE REST INFORMATION IS JUST A NOISE

SELECT *
FROM (
SELECT 
	orderid,
    productid, 
    sales,
    ROW_NUMBER() OVER(
			PARTITION BY productid
            ORDER BY sales DESC
            ) rank_by_product
FROM orders)row_numbers
WHERE rank_by_product=1;


-- FIND THE LOWEST 2 CUSTOMERS BASED ON THEIR TOTAL SALES
	-- GET THE ROWS BASED ON CUSTOMERS AND THEIR TOTAL SALES
    -- PARTITION BY CUSTOMERS AND SALES

SELECT *
FROM (
SELECT 
	customerid,
    productid,
    sales,
    SUM(sales) OVER(PARTITION BY customerid) total_sales,
    ROW_NUMBER() OVER(
			PARTITION BY customerid
            ORDER BY sales ASC
			) rank_by_customer
FROM orders
ORDER BY total_sales
)T
WHERE rank_by_customer=1
LIMIT 2;

-- BARAA IMPLEMENTATION

-- use subquery to query the window functions column
SELECT *
FROM (
SELECT 
	customerid,
    SUM(sales) total_sales,
    ROW_NUMBER() OVER(ORDER BY SUM(sales)) rank_customers
FROM orders
GROUP BY customerid)T WHERE rank_customers <=2;


-- ASSIGN UNIQUE IDS TO THE ROWS OF THE ORDER ARCHIVE TABLE

SELECT *,
	ROW_NUMBER() OVER(ORDER BY orderid) unique_ranks
FROM orders_archive;

-- IDENTIFY DUPLICATES ROWS IN THE TABLE 'ORDER ARCHIVE' AND RETURN A CLEAN RESULTS WITHOUT ANY DUPLICATES

SELECT *
FROM (
	SELECT 
	*,
		ROW_NUMBER() OVER(
				PARTITION BY orderid
				ORDER BY orderid
				) rank_orders
	FROM orders_archive
)T WHERE rank_orders=1;

-- bara implementaion
-- LATEST CREATION TIME IS THE REAL ONE

SELECT *
FROM (
	SELECT 
	*,
		ROW_NUMBER() OVER(
				PARTITION BY orderid
				ORDER BY creationtime DESC
				) rank_orders
	FROM orders_archive
)T WHERE rank_orders=1;

-- SEGMENT ALL ORDERS INTO 3 CATEGORIES: HIGH, MEDIUM, LOW SALES
SELECT *,
	CASE
		WHEN sales_segments = 1 THEN 'HIGH'
        WHEN sales_segments = 2 THEN 'MEDIUM'
        WHEN sales_segments = 3 THEN 'LOW'
	END segment_categories
FROM (
	SELECT 
		orderid, 
		sales,
		NTILE(3) OVER(ORDER BY sales DESC) sales_segments
	FROM orders)t;
    
-- IN ORDER TO EXPORT THE DATA, DIVIDE THE ORDERS INTO 2 GROUPS

SELECT 
	*,
	NTILE(2) OVER(ORDER BY orderid) buckets
FROM orders;