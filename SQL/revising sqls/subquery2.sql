-- 1. find the products that have a price higher than the average price of all products

SELECT *
FROM products
WHERE price > (
	SELECT 
		AVG(price) average_price
	FROM products);
    
-- 2. Rank Customers based on their total amount of sales.

SELECT 
	*,
    ROW_NUMBER() OVER(ORDER BY total_sales DESC) rank_customers
FROM (
	SELECT 
		customerid,
		SUM(sales) total_sales
	FROM orders
	GROUP BY customerid
)T;

-- 3. show the productid, name, price and total number of orders

SELECT
	productid,
    product,
    price,
    (
		SELECT 
			COUNT(orderid) 
		FROM orders o 
		WHERE o.productid = p.productid
    ) total_orders
FROM products p;

-- 4. Show all customer details & find the total orders for each customer

SELECT
	*,
    (
		SELECT 
			COUNT(orderid)
		FROM orders o
        WHERE o.customerid = c.customerid
    ) total_orders
FROM customers c;

