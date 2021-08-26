/*
SQL Aggregations
Count - 
*/

SELECT COUNT(*) as order_count
FROM orders
WHERE occured_at >= '2016-12-01'
AND occured_at < '2017-01-01'