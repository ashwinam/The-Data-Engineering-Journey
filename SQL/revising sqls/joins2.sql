-- No Joins
-- 1. Retrieve All the data from customers and orders as seperated results

SELECT *
FROM customers;

SELECT *
FROM orders;

-- Inner Join
-- Get all customers along with their orders, but only for customers who have placed an order

SELECT 
	c.customerid,
    c.firstname,
    c.lastname,
    c.country,
    c.score,
    o.orderid,
    o.productid,
    o.orderdate,
    o.orderstatus
FROM customers c
INNER JOIN orders o
	ON c.customerid = o.customerid;
    
-- Left Join
-- Get all customer along with their orders including those without orders

SELECT 
	c.customerid,
    c.firstname,
    c.lastname,
    c.country,
    c.score,
    o.orderid,
    o.productid,
    o.orderdate,
    o.orderstatus
FROM customers c
LEFT JOIN orders o
	ON c.customerid = o.customerid;
    
-- RIGHT JOIN
-- Get all customers along with their orders, including orders without matching customers

SELECT 
	c.customerid,
    c.firstname,
    c.lastname,
    c.country,
    c.score,
    o.orderid,
    o.productid,
    o.orderdate,
    o.orderstatus
FROM customers c
RIGHT JOIN orders o
	ON c.customerid = o.customerid ;
    
-- Left Anti Join
-- Get all customers who havent placed any orders

SELECT 
	*
FROM customers c
LEFT JOIN orders o
	ON c.customerid = o.customerid
WHERE o.customerid IS NULL;