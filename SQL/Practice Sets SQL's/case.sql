-- GENERATE A REPORT SHOWING THE TOTAL SALES FOR THE EACH CATEGORY
-- HIGH: IF THE SALES HIGHER THAN 50
-- MEDIUM: IF THE SALES BETWEEN 20 AND 50
-- LOW: IF THE SALES EQUAL OR LOWER THAN 20

SELECT 
	*,
	CASE
		WHEN sales > 50 THEN 'HIGH'
        WHEN sales > 20 THEN 'MEDIUM'
        ELSE 'LOW'
	END AS category
    
FROM orders
ORDER BY sales;

-- RETRIEVE THE EMPLOYEE DETAILS WITH GENDER DISPLAYED AS FULL TEXT

SELECT 
	CONCAT(firstname, ' ', lastname),
    CASE
		WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'F' THEN 'Female'
	END AS full_gender_text
FROM employees;

-- RETRIEVE CUSTOMER DETAILS WITH ABBREVIATED COUNTRY CODE

SELECT
	firstname,
    lastname,
    country,
    CASE
		WHEN country = 'Germany' THEN 'DE'
        WHEN country = 'USA' THEN 'Us'
        ELSE 'N/A'
	END country_abbr
FROM customers;

-- FIND THE AVERAGE SCORES OF CUSTOMERS AND TREAT NULL AS 0
-- AND PROVIDE ADDITIONAL DETAILS SUCH AS CUSTOMERID & LASTNAME

SELECT 
	customerid,
    lastname,
    CASE
		WHEN score IS NOT NULL THEN score
        ELSE 0
	END cleaned_score,
    AVG(score) OVER() avg_score,
    AVG(
		CASE
			WHEN score IS NOT NULL THEN score
			ELSE 0
		END
	) OVER() avg_score_with_0
    
FROM customers;

-- COUNT HOW MANY TIMES EACH CUSTOMER MADE AN ORDER WITH SALES MORE THAN 30

-- STEPS:
	-- 1. FIRST USE THE FLAG FOR ROW WISE IF SALES > 30 THEN 1 ELSE 0
    -- 2. SUM THE FLAGS BASED ON CUSTOMERS USING GROUP BY, YOU WILL GET COUNTS FROM EACH CUSTOMER
    

SELECT 
	customerid,
    -- CASE
-- 		WHEN sales > 30 THEN 1
--         ELSE 0
-- 	END sales_highest,
    SUM( CASE
		WHEN sales > 30 THEN 1
        ELSE 0
	END
    ) sales_count_sum,
    COUNT(*) as total_sales_count
FROM orders
GROUP BY customerid;
    