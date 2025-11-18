-- query 1
SELECT * FROM customers;
-- query 2
SELECT * FROM orders;


-- static values: 
SELECT 123
SELECT 'Hello' AS static_string

-- adding new column to table
-- base columns
SELECT 
id, 
first_name,
-- static value
'new customer' AS customer_type
FROM customers
