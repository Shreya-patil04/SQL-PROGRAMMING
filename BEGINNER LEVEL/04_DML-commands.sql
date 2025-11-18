-- 1. INSERT QUERY: -

-- method 1
-- SQL TASK:Insert values in customers table
INSERT INTO customers( id, first_name, country, score)
VALUES 
(7 , 'Anna' , 'USA' , NULL),
(8 , 'Bella' , NULL , 100)
-- we cannot add NULL values to primary key columns
SELECT * FROM customers

-- SQL TASK:Insert values only in 2 columns
INSERT INTO customers( id, first_name)
VALUES 
(8 , 'Jason' )
SELECT * FROM customers

-- method 2
-- SQL TASK: copy data from 'customers' table into 'persons'
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
id , 
first_name,
NULL ,
'unknown'
FROM customers
SELECT * FROM persons


-- 2. UPDATE QUERY: -
-- SQL TASK: Change the score of customer 6 to 0
UPDATE customers
SET score = 0
WHERE id = 6
SELECT * FROM customers

-- SQL TASK: Change the score of customer 9 to 0 & update the country to UK
UPDATE customers
SET score = 0,
	country = 'UK'
WHERE id = 9
SELECT * FROM customers

-- SQL TASK: Update all customers with a NULL score by setting their score to 0
UPDATE customers
SET score = 0
WHERE score IS NULL
SELECT * FROM customers


-- 3. DELETE QUERY: -
-- SQL TASK:delete all customers with an ID greater than 5
DELETE FROM customers
WHERE id > 5
SELECT * FROM customers

-- SQL TASK: Delete all data from table persons
DELETE FROM persons
-- or use truncate (much cleaner & faster)
TRUNCATE TABLE persons
SELECT * FROM persons