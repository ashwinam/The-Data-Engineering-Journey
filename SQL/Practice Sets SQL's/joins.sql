-- RETRIEVE ALL DATA FROM CUSTOMERS AND ORDERS AS SEPERATE RESULTS

SELECT *
FROM customers;

SELECT * 
FROM orders;

-- GET ALL CUSTOMERS ALONG WITH THEIR ORDERS, BUT ONLY FOR CUSTOMERS WHO HAVE PLACED AN ORDER.
	-- MATCHED COLUMN IS CUSTOMER_ID
    
SELECT *
FROM customers
INNER JOIN orders
	ON customers.id = orders.customer_id;
    
-- GET ALL CUSTOMERS ALONG WITH THEIR ORDERS INCLUDING THOSE WITHOUT ORDERS

SELECT 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
	ON c.id = o.customer_id;
    
-- GET ALL CUSTOMERS ALONG WITH THEIR ORDERS, INCLUDING ORDERS WITHOUT MATCHING CUSTOMERS

SELECT
	c.customerid,
    c.firstname,
    o.orderid,
    o.sales
FROM customers AS c
RIGHT JOIN orders AS o
	ON o.customerid = c.customerid;
    
-- GET ALL CUSTOMERS ALONG WITH THEIR ORDERS, INCLUDING ORDERS WITHOUT MATCHING CUSTOMERS (USING LEFT JOIN)

SELECT 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM orders AS o
LEFT JOIN customers c
	ON c.id = o.customer_id;
    
-- GET ALL CUSTOMERS AND ALL ORDERS, EVEN IF THERE'S NO MATCH
	-- NO FULL JOIN IN MYSQL 

-- SELECT 
-- 	c.id,
--     c.first_name,
--     o.order_id,
--     o.sales
-- FROM customers AS c
-- FULL JOIN orders AS o
-- 	ON c.id = o.customer_id;

-- GET ALL CUSTOMERS WHO HAVEN'T PLACED ANY ORDERS

SELECT 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
	ON c.id = o.customer_id
WHERE o.customer_id IS NULL;

-- GET ALL ORDERS WITHOUT MATCHING CUSTOMERS

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
	ON c.id = o.customer_id
WHERE c.id IS NULL; 

-- GET ALL CUSTOMERS ALONGS WITH THEIR ORDERS, BUT ONLY FOR CUSTOMERS WHO HAVE PLACED AN ORDER (WITHOUT USING INNER JOIN)

SELECT 
	c.id,
	c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
	ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL;


/* 
USING SALESDB, 
RETRIEVE A LIST OF ALL ORDERS ALONG WITH THE RELATED CUSTOMER, 
PRODUCT AND EMPLOYEE DETAILS 
*/

USE salesdb;

-- get all the orders
-- get all the related customers who has orders
-- get all the products which is in the orders table
-- get all the employee details

SELECT 
	o.orderid,
    o.orderstatus,
    o.sales,
    c.firstname AS customer,
    p.product,
    p.category,
    p.price, 
    e.firstname AS employee,
    e.department
FROM orders AS o
INNER JOIN customers AS c
	ON o.customerid = c.customerid
INNER JOIN products AS p
	ON o.productid = p.productid
INNER JOIN employees AS e
	ON o.salespersonid = e.employeeid;