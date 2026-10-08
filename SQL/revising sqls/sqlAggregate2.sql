-- 1. Find total number of orders

SELECT COUNT(*) total_orders
FROM orders;

-- 2. Find the total Sales Of orders

SELECT SUM(sales) total_sales
FROM orders;

-- 3. Find the average sales of all orders

SELECT AVG(sales) average_sales
FROM orders;

-- 4. Find the Highest & Minimum sales
SELECT
	MAX(sales) highest_sales,
    MIN(sales) lowest_sales
FROM orders;