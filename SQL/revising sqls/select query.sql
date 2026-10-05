-- SELECT PROBLEM STATEMENTS

-- 1. Retrieve All Customers Data

USE salesdb;

SELECT *
FROM customers;

-- 2. Retrieve All The Orders Data

SELECT *
FROM orders;

-- 3. Retrieve Each Customers name, country and score

SELECT 
	firstname,
    country,
    score
FROM customers;

-- 4. Retrieve the Customers with a Score not equal to 0.

SELECT * -- 3
FROM customers -- 1
WHERE -- 2
	score != 0;
    
-- 5. Retrieve Customers from Germany

SELECT *
FROM customers
WHERE 
	country = 'Germany';
    
-- 6. Retrieve All Customers and Sort the data by the highest scores first

SELECT *
FROM customers
ORDER BY 
	score DESC;
    
-- 7. Retrieve All Customers and Sort the results by the lowest scores first.

SELECT *
FROM customers
ORDER BY
	score ASC;

-- 8. Retrieve All Customers and sort the results by the country and then by the highest score.

SELECT *
FROM customers
ORDER BY 
	country DESC,
    score DESC;

-- 9. Find the Total Score for each country.

SELECT 
	country,
	SUM(score) total_scores
FROM customers
GROUP BY country;

-- 10. Find the Total score and Number of customers for each country.

SELECT
	country,
	SUM(score) total_scores,
    COUNT(*) total_customers
FROM customers
GROUP BY country;

-- 11. Find the Average Score for each country, 
	-- Considering only customers with a score not equal to 0 and return only those country with an average score greater 430.

SELECT 
	country,
	AVG(score) average_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING average_score > 430;

-- 12. Return Unique List of All Countries

SELECT
	DISTINCT country
FROM customers;

-- 13. Retrieve Only 3 customers

SELECT *
FROM customers
LIMIT 3;

-- 14. Retrieve top 3 customers with the highest score

SELECT *
FROM customers
ORDER BY score DESC
LIMIT 3;

-- 15. Retrieve the lowest 2 customers based on the score

SELECT *
FROM customers
ORDER BY 
	score ASC
LIMIT 2;

-- 16. Get the 2 Most Recent Orders

SELECT * 
FROM orders
ORDER BY orderdate DESC
LIMIT 2;