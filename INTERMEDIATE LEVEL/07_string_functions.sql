USE MyDatabase

-- MANIPULATION: -

-- 1. concat()
-- SQL TASK: Concatenate first name and country into one column
SELECT
first_name,
country,
CONCAT (first_name , ' ' , country) AS name_country
FROM customers

-- 2. lower()
-- SQL TASK: Transform the customer's firstname to lowercase
SELECT
first_name,
LOWER (first_name) AS low_name
FROM customers

-- 3. upper()
-- SQL TASK: Transform the customer's firstname to uppercase
SELECT
first_name,
UPPER (first_name) AS up_name
FROM customers

-- 4. trim()
-- SQL TASK: Find customers whose first name contains leading or trailing spaces
SELECT
first_name
FROM customers
WHERE first_name != TRIM( first_name )
--or
SELECT
first_name,
LEN(first_name) len_name,
LEN(TRIM(first_name)) len_trim_name,
LEN(first_name) - LEN(TRIM(first_name)) flag
FROM customers
WHERE LEN(first_name) != LEN(TRIM(first_name))

-- 5. replace()
-- SQL TASK: remove dashes (-) from a phone number
SELECT 
'123-456-7890' AS phone,
REPLACE('123-456-7890' , '-' , '' ) AS clean_phone1
-- or
SELECT 
'123-456-7890' AS phone,
REPLACE('123-456-7890' , '-' , '/' ) AS clean_phone2

-- SQL TASK: replace file extence from txt to csv
SELECT
'report.txt' AS file_name ,
REPLACE( 'report.txt' , '.txt' , '.csv' ) AS new_file_name


-- CALCULATION: -

-- 1. len()
--SQL TASK: calculate the length of each customer's first name
SELECT
first_name,
LEN(first_name) AS len_name
FROM customers


-- STRING FUNCTION: -

-- 1. left()
-- SQL TASK: retrieve the first 2 characters from the first name
SELECT
first_name,
LEFT(first_name,2) AS first_2_name
FROM customers


-- 2. right()
-- SQL TASK: retrieve the last 2 characters from the first name
SELECT
first_name,
RIGHT(first_name,2) AS last_2_name
FROM customers

--3. substring()
-- SQL TASK: retieve a list of customer's first names after removing the first customer
SELECT
first_name,
SUBSTRING(TRIM(first_name) , 2 ,LEN(first_name )) AS sub_name
FROM customers
