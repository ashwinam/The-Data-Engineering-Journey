-- Logical Operators

-- 1. Retrieve all customers from Germany
USE salesdb;

SELECT *
FROM customers
WHERE country = 'Germany';

-- 2. Retrieve all customers who are not from Germany

SELECT *
FROM customers
WHERE country != 'Germany';

-- 3. Retrieve All customers with a score greater than 500

SELECT *
FROM customers
WHERE score > 500;

-- 4. Retrieve all columns with a score of 500 or more

SELECT *
FROM customers
WHERE score >= 500;

-- 5. Retrieve all customers with a score less than 500

SELECT * 
FROM customers
WHERE score < 500;

-- 6. Retrieve all the customers with a score less than 500 or equal to 500.

SELECT *
FROM customers
WHERE score <= 500;

-- Logical Operators

-- 1. Retrieve All customers who are from the USA and have a score greater than 500

SELECT *
FROM customers
WHERE 
	country = 'USA' AND 
    score > 500;
    
-- 2. Retrieve all customers who are either from USA or have a score greater than 500.

SELECT *
FROM customers
WHERE
	country = 'USA' 
    OR 
    score > 500;
    
-- 3. retrieve all customers with a score not less than 500

SELECT *
FROM customers 
WHERE NOT score < 500;

-- Range Operator

-- 1. Retrieve all customers whose score falls in the range between 100 & 500

SELECT *
FROM customers 
WHERE score BETWEEN 100 AND 500;

-- Membershio Operator

-- 1. Retrieve All customers from either Germany OR USA

SELECT *
FROM customers
WHERE country IN ('Germany', 'USA');