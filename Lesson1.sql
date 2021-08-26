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

/*
LIKE operator
Especially for text, WHERE = would be too specific and not return anything
*/

SELECT name
FROM accounts
WHERE name LIKE 'C%';

SELECT name
FROM accounts
WHERE name LIKE '%one%';

SELECT name
FROM accounts
WHERE name LIKE '%s';

/*
IN operator
Allows to filer data based on several possible values
Requires single quotation marks around non-numerical data
*/

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

/*
NOT operator
Provides the inverse results for IN, LIKE, AND Similar Operators
*/

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';

SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';

SELECT name
FROM accounts
WHERE name NOT LIKE '%s';

/*
AND Operator
Filter based on multiple criteria
*/

SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

SELECT occurred_at, gloss_qty 
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

/*
OR Operator
Can be combined with other operators by using parentheses
*/

SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');

/*
JOIN clause
Tells Query an additional table from to pull data like a second FROM clause
Always have the primary key =  the foreign key
ON clause 
Specifies a logical statement to combinte the table in FROM and JOIN statements
ALIAS
To shorten the name of a table, will be created in the FROM or JOIN class
OPTIONS
LEFT JOIN, RIGHT JOIN, OUTER JOIN
*/

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

SELECT orders.standard_qty, orders.gloss_qty, 
       orders.poster_qty,  accounts.website, 
       accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id

SELECT a.primary_poc, w.occurred_at, w.channel, a.name

FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

SELECT r.name region, a.name account, 
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

SELECT c.countryid, c.countryName, s.stateName
FROM Country c
JOIN State s
ON c.countryid = s.countryid;

SELECT c.countryid, c.countryName, s.stateName
FROM Country c
LEFT JOIN State s
ON c.countryid = s.countryid;


