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