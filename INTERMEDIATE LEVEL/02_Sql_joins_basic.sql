USE MyDatabase

-- BASIC JOIN OPERATIONS

-- 1. NO JOIN
-- SQL TASK: Retrieve all data from customers and orders as seperate results
SELECT* 
FROM customers;
SELECT* 
FROM orders;


-- 2. INNER JOIN
-- SQL TASK: Get all customers along with their, but only for customers who have plced an order
SELECT *
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id
-- to be more specific
SELECT 
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id

-- assigning shortcut to table names
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id


-- 3. LEFT JOIN
-- SQL TASK: 