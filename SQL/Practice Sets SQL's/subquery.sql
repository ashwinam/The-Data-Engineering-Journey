-- FIND THE PRODUCTS THAT HAVE A PRICE HIGHER THAN THE AVERAGE PRICE OF ALL PRODUCTS

SELECT *
FROM (
	SELECT 
		*,
		AVG(price) OVER() avg_price
	FROM products
)AS product_subquery
WHERE price > avg_price;

-- RANK CUSTOMERS BASED ON TOTAL AMOUNT OF SALES

-- MAIN QUERY
SELECT *, RANK() OVER(ORDER BY total_sales DESC) rank_customers
FROM (
	-- SUBQUERY
	SELECT 
		customerid,
		SUM(sales) total_sales
	FROM orders
	GROUP BY customerid
)T;

-- SHOW THE PRODUCT ID, NAMES, PRICES AND TOTAL NUMBER OF ORDERS

SELECT 
	productid,
    product,
    price,
    -- SUBQUERY
    (SELECT COUNT(*) FROM orders) orders_count
FROM products;

-- SHOW ALL THE CUSTOMER DETAILS & FIND THE TOTAL ORDERS FOR EACH CUSTOMER

/*
SELECT 
	c.customerid,
    c.firstname,
    c.lastname,
    c.country,
    c.score,
    COUNT(o.orderid) OVER(PARTITION BY o.customerid)
FROM customers c
JOIN orders	o
	ON c.customerid = o.customerid;
/

/* 
SELECT *
FROM customers
*/

SELECT 
	c.*,
    o.orders_count
FROM customers c
LEFT JOIN (
	SELECT 
		customerid,
		COUNT(orderid) AS orders_count
	FROM orders
	GROUP BY customerid
) O
ON c.customerid = o.customerid;

-- FIND THE PRODUCTS THAT HAVE A PRICE HIGHER THAN THE AVERAGE PRICE OF ALL PRODUCTS

SELECT
	*
FROM products
WHERE price > (
	SELECT AVG(price) avg_price
	FROM products
);

-- SHOW THE DETAILS OF ORDERS MADE BY CUSTOMERS IN GERMANY

SELECT
	*
FROM orders
WHERE customerid IN 
	(
		SELECT customerid 
		FROM customers 
		WHERE country='Germany'
    );

-- FIND THE FEMALE EMPLOYEES WHOSE SALARIES ARE GREATER, THAN THE SALARIES OF ANY MALE EMPLOYEES

SELECT *
FROM employees
	WHERE gender = 'F' 
	AND salary > ANY(
					SELECT
						salary
					FROM employees
					WHERE gender = 'M'
					);
                    
-- FIND THE FEMALE EMPLOYEES WHOSE SALARIES ARE GREATER, THAN THE SALARIES OF ALL MALE EMPLOYEES

SELECT *
FROM employees
	WHERE gender = 'F' 
	AND salary > ALL(
					SELECT
						salary
					FROM employees
					WHERE gender = 'M'
					);

-- SHOW THE DETAILS OF ORDERS MADE BY CUSTOMERS IN GERMANY

SELECT 
	customerid,
    sales
FROM orders o
WHERE EXISTS(
	SELECT 1
    FROM customers c
    WHERE o.customerid=c.customerid AND country='Germany'
);