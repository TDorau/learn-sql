/*
LIMIT
- Limits the response to only include the first 15 rows
*/
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;
 
/*
ORDER BY
- By default from A-Z, lowest to highest or earliest to latest (ascending order)
- Add DESC to have descending order (e.g. ORDER BY occurred_at DESC)
- Ordering by multiple is possible (e.g. ORDER BY total_amt_usd DESC, account_id)
--> Only makes sense if there are duplicate elements 
*/

SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

SELECT id, account_id,total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

/*
Write a query that displays the order ID, account ID, and total dollar amount
for all the orders, sorted first by the account ID (in ascending order), and 
then by the total dollar amount (in descending order).
*/

SELECT ID, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;

SELECT ID, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;
