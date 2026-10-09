-- 1. Find the total sales across all orders

SELECT 
	SUM(sales) total_sales
FROM orders;

-- 2. Find the total sales for each product

SELECT 
	productid, 
	SUM(sales) total_sales
FROM orders
GROUP BY productid;

-- 3. find the total sales for each product, additionally provide orderid and order date

SELECT 
	productid,
    orderid,
    orderdate,
    SUM(sales) OVER(PARTITION BY productid) total_sales
FROM orders;

-- 4. find the total sales for each combination of product and order status

SELECT 
	productid,
    orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(sales) OVER(partition by productid, orderstatus) total_sales
FROM orders;

-- 5. Rank each order based on their sales from highest to lowest, additionally provide details such as order id & order date

SELECT
	orderid,
    orderdate,
    sales,
    RANK() OVER(ORDER BY sales DESC)
FROM orders;

-- 6. Rank customers based on their total sales

SELECT
	customerid,
    SUM(sales) total_sales,
    RANK() OVER(ORDER BY SUM(sales) DESC) ranks
FROM orders
GROUP BY customerid;

-- 7. rank the order based on their sales from highest to lowest

SELECT 
	orderid,
    ROW_NUMBER() OVER(ORDER BY sales DESC) rank_orders
FROM orders;

-- TOP N Analysis

-- 8. Find the Top highest sales for each product

SELECT *
FROM (
SELECT 
	orderid, 
    orderdate,
    productid,
    sales,
    RANK() OVER(PARTITION BY productid ORDER BY sales DESC) highest_sales_rank
FROM orders) table_rank
WHERE highest_sales_rank = 1;

-- Bottom N Analysis

-- 9. find the lowest 2 customer based on their total sales.

SELECT *
FROM (
	SELECT 
		customerid,
		SUM(sales) total_sales,
		RANK() OVER(ORDER BY SUM(sales)) rank_customers
	FROM orders
	GROUP BY customerid
)t
WHERE rank_customers <= 2;

-- Generate Unique ids
-- 10. Assign Unique ids to the rows of the orders archieve table

SELECT 
	*,
    ROW_NUMBER() OVER() unique_ids
FROM orders_archive;


-- IDENTIFY DUPLICATES
-- identify duplicates rows in the table orders archieve and return a clean result without any duplicates

SELECT *
FROM (
	SELECT
		*,
		ROW_NUMBER() OVER(PARTITION BY orderid ORDER BY orderid) rank_orders
	FROM orders_archive)t
WHERE rank_orders = 1;