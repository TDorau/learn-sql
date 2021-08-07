### Limits
/*
Limits the response to only include the first 15 rows
*/
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;