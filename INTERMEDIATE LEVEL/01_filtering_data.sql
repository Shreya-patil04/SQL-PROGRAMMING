USE MyDatabase
-- WHERE OPERATORS: -

-- COMPARISION OPERATORS --
-- 1. EQUAL TO
-- SQL TASK: retreive all customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany'

-- 2. NOT EQUAL TO
-- SQL TASK: retrieve all customers who are not from germany
SELECT *
FROM customers
WHERE country != 'Germany'
WHERE country <> 'Germany'

-- 3. GREATER THAN 
-- SQL TASK: retrieve all customers with a score greater than 500
SELECT *
FROM customers
WHERE score > 500

-- 4. GREATER THAN OR EQUAL TO
-- SQL TASK: retrieve all customers with a score 500 or more
SELECT *
FROM customers
WHERE score >= 500

-- 5. SMALLER THAN 
-- SQL TASK: retrieve all customers with a score less than 500
SELECT *
FROM customers
WHERE score < 500

-- 6. SMALLER THAN OR EQUAL TO
-- SQL TASK: retrieve all customers with a score 500 or less
SELECT *
FROM customers
WHERE score <= 500



-- LOGICAL OPERATORS --
-- 1. AND
-- SQL TASK: retrieve all customers who are from the USA AND have a score greater than 500
SELECT *
FROM customers
WHERE country = 'USA' AND
score > 500

-- 2. OR
-- SQL TASK: retrieve all customers who are from the usa OR have a score greater than 500
SELECT *
FROM customers
WHERE country = 'USA' OR
score > 500

-- 3. NOT
-- SQL TASK: retrieve all customers with a score NOT less than 500
SELECT *
FROM customers
WHERE score >= 500
-- this can be written as
WHERE NOT score < 500


-- RANGE OPERATOR --
-- BETWEEN
-- SQL TASK: Retrieve all customers whose score falls in the range between 100 and 500
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500
-- this is equivalent of 
SELECT *
FROM customers
WHERE score >= 100 AND <= 500


-- MEMBERSHIP OPERATOR --
-- IN
-- SQL TASK: retrieve all customers from either Germany or USA
SELECT *
FROM customers
WHERE country IN ( 'Germany' , 'USA' )
-- this is equivalent of 
WHERE country = 'Germany' OR country = 'USA'

-- NOT IN
-- SQL TASK: retrieve all customers not from either Germany or USA
SELECT *
FROM customers
WHERE country NOT IN ( 'Germany' , 'USA' )


-- SEARCH OPERATOR --
-- LIKE
-- SQL TASK: 