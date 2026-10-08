-- Union
-- Combine the data from employees & customers into one table

SELECT 
	firstname,
    lastname
FROM employees
UNION
SELECT 
	firstname,
    lastname
FROM customers;

-- Union All
-- Combine the data from employees & customers into one table, Including duplicates

SELECT 
	firstname,
    lastname
FROM employees
UNION ALL
SELECT 
	firstname,
    lastname
FROM customers;

-- Except
-- find employees who are not customers at the same time

SELECT 
	firstname,
    lastname
FROM employees
EXCEPT
SELECT 
	firstname,
    lastname
FROM customers;

-- INTERSECT
-- FIND THE CUSTOMERS WHO ARE ALSO CUSTOMERS

SELECT 
	firstname,
    lastname
FROM employees
INTERSECT
SELECT 
	firstname,
    lastname
FROM customers;

