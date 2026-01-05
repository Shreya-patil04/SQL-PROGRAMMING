use MyDatabase

-- AGGREGATE FUNCTIONS: -

-- SQL TASK: Find the total number of orders
SELECT
COUNT(*) AS total_number_of_orders
FROM orders

-- SQL TASK: Find the total sales from all orders
SELECT
SUM(sales) AS total_sales
FROM orders

-- SQL TASK: Find the average sales from all orders
SELECT
AVG(sales) AS average_sales
FROM orders

-- SQL TASK: Find the highest sales from all orders
SELECT 
MAX(sales) AS highest_sales
FROM orders

-- SQL TASK: Find the lowest sales from all orders
SELECT 
MIN(sales) AS lowest_sales
FROM orders