-- FIND THE TOTAL SALES ACROSS ALL ORDERS
-- FIND THE TOTAL SALES FROM ORDER TABLE

SELECT 
	SUM(sales)
FROM orders;

-- FIND THE TOTAL SALES FOR EACH PRODUCT
	-- TOTAL SALES BASED ON EACH PRODUCT
    -- AGGREGATING PRODUCT WISE SALES, I.E. SUM FUNCTION
    
SELECT 
	productid,
    SUM(sales) total_sales
FROM orders
GROUP BY productid;

-- FIND THE TOTAL SALES FOR EACH PRODUCT, ADDITIONALLY PROVIDE DETAILS SUCH AS ORDERID AND ORDER_DATE
	-- PRODUCT WISE TOTAL SALES WITH EXTRA DETAILS, SUCH AS ORDER ID AND ORDER DATE
    
SELECT 
	orderid,
    orderdate,
    productid,
    SUM(sales) total_sales
FROM orders
GROUP BY productid;

-- ABOVE SOLUTION THROWS AN ERROR, SOLVE IT USING WINDOW FUNCTION

SELECT 
	orderid,
    orderdate,
    productid,
    SUM(sales) OVER(PARTITION BY productid) total_sales
FROM orders;

-- FIND THE TOTAL SALES FOR EACH COMBINATION OF PRODUCT AND ORDER STATUS

SELECT 
	orderid,
    orderdate,
    productid,
    orderstatus,
    SUM(sales) OVER (PARTITION BY productid, orderstatus) total_sales_by_product_and_status
FROM orders
ORDER BY productid, orderstatus;
