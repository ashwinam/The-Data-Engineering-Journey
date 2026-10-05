SELECT
	orderid,
    creationtime,
    DAY(creationtime) day,
    MONTH(creationtime) month,
    YEAR(creationtime) year,
    WEEK(creationtime) week,
    QUARTER(creationtime) quarter,
    HOUR(creationtime) hour,
    MINUTE(creationtime) minute,
    SECOND(creationtime) seconds,
    EXTRACT(YEAR FROM creationtime) year_extraction,
    DAYNAME(creationtime) day_name,
    MONTHNAME(creationtime) month_name,
    DATE_FORMAT(creationtime, '%Y/%m/%d %h:%i') truncate_date,
    LAST_DAY(creationtime) last_day_eomonth
FROM orders;

-- HOW MANY ORDERS WERE PLACED EACH YEAR

SELECT
	YEAR(orderdate) year_count,
    COUNT(*) count
FROM orders
GROUP BY YEAR(orderdate);

-- HOW MANY ORDERS WERE PLACED EACH MONTH

SELECT
	monthname(orderdate) month_wise_orders,
    COUNT(*) order_count
FROM orders
GROUP BY monthname(orderdate);

SELECT DATEDIFF(CURDATE(), "2026-01-01");
