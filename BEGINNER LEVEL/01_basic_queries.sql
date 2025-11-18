USE MyDatabase
-- comments
-- 1.this is a single line comment.
/* This is a 
multiline
comment */

--SELECT & FROM QUERY:-
-- SQL TASK: Retrieve all customer data from databse
Select *
FROM customers

-- SQL TASK: Retrieve all order data from databse
Select *
FROM orders

-- SQL TASK: Retrieve each customer's name, country and score
SELECT
	first_name,
	country,
	score
FROM customers


-- DISTINCT: -
-- SQL TASK: Return Unique list of all countries
SELECT DISTINCT country 
FROM customers


-- TOP:-
-- SQL TASK: Retrieve only 3 customers
SELECT TOP 3 *
FROM customers

-- SQL TASK: Retrieve the top 3 customers with highest scores
SELECT TOP 3 *
FROM customers
ORDER BY score DESC;

-- SQL TASK: Retrieve the lowest 2 customers with highest scores
SELECT TOP 2*
FROM customers
ORDER BY score ASC;

-- SQL TASK: Get the 2 most recent orders
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC;


-- WHERE QUERY:-
-- SQL TASK: Retrieve customers with a score not equal to 0
SELECT *
FROM customers
WHERE score != 0

-- SQL TASK: Retrieve customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany'


--GROUP BY: -
-- SQL TASK: Find the total score for each country
SELECT country , sum(score) AS total_score
FROM customers
GROUP BY country

-- SQL TASK: find the total score and the total number of customers for each country
SELECT 
	country,
	SUM(score) AS total_score,
	Count(id) AS total_customers
FROM customers
GROUP BY country


-- HAVING: -
-- SQL TASK: filter score greater than 800
SELECT 
	country,
	SUM(score) AS total_score,
	Count(id) AS total_customers
FROM customers
GROUP BY country
HAVING sum(score) > 800


-- ORDERBY:-
-- SQL TASK: Retrieve all customers and sort the results by the higghest 5 scores first
SELECT *
FROM customers
ORDER BY score DESC
-- ascending order
SELECT *
FROM customers
ORDER BY score ASC

-- nested sorting
-- SQL TASK: Retrieve all customers and sort the results by the country and then by the highest score
SELECT *
FROM customers
ORDER BY country ASC, score DESC     


/* SQL TASK: Find the avergae score for each country considering only customers with a score not equal to 0
			 and return only those countries with an avergae score greater than 430 */
SELECT 
	country, 
	AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) >430