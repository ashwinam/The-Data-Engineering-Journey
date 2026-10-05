-- Analyze the 'Month Over Month' Performance by finding the percentage change in sales between the current & Previous month
-- TIME SERIES ANALYSIS
	-- THE PROCESS OF ANALYZING THE DATA TO UNDERSTAND PATTERNS, TRENDS AND BEHAVIOUR OVER TIME

SELECT 
	*, 
    current_month_sales - previous_month_sales AS MOM_CHANGE,
    ROUND(CAST((current_month_sales - previous_month_sales) AS FLOAT) / previous_month_sales * 100, 1) MOM_PERCENT
FROM (
SELECT 
	MONTH(orderdate) order_date,
    SUM(sales) current_month_sales,
    LAG(SUM(sales)) OVER(ORDER BY MONTH(orderdate)) previous_month_sales
    
FROM orders
GROUP BY MONTH(orderdate))t;