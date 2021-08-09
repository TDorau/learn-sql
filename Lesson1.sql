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

/*
WHERE
Allows to filter a set of results based on specific criteria
(e.g. WHERE account_id = 4251)
Common symbols: >, <, >=, <=, =, != (not equal to)
Works on nun-numeric data with LIKE, NOT, IN, =, !=
When using an operator on a value that is non-numeric, put the value in single quotes
*/
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT *
FROM orders
WHERE total_amt_usd <= 500
LIMIT 10;

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

/*
Derived Column
A new column that is a manipulation of the existing columns in the database
(e.g. gloss_qty + poster_qty AS nonstandard_qty)
Mostly exist only for the duration of the query
*/

SELECT id, account_id, standard_amt_usd / standard_qty AS unit_price
FROM orders
LIMIT 10;

SELECT id, account_id,
    poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;