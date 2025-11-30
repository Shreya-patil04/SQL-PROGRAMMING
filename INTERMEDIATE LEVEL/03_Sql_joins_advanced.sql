USE MyDatabase

-- ADVANCED JOIN OPERATIONS

-- 1. LEFT ANTI JOIN
-- SQL TASK: Get all customers who haven't placed any order
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL

-- SQL TASK: Get all customers along with their orders but only customers who have placed an oder 
-- ( without using INNER JOIN )
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL


-- 2. RIGHT ANTI JOIN
-- SQL TASK: Get all orders without matching customers
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL

-- SQL TASK: Get all orders without matching customers using left join
SELECT *
FROM orders AS o
LEFT JOIN customers AS c 
ON c.id = o.customer_id
WHERE c.id IS NULL


-- 3. FULL ANTI JOIN
-- SQL TASK	: find customers without orders and orders without customers
SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL

-- SQL TASK: Get all customers along with their orders but only customers who have placed an oder 
-- ( without using INNER JOIN )
SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NOT NULL AND o.customer_id IS NOT NULL


-- 4. CROSS JOIN
-- SQL TASK: Generate all possible combinations of customers and orders
SELECT *
FROM customers AS c
CROSS JOIN orders AS o


-- MULTI-TABLE JOIN: -
/* 
SQL TASK: Using SalesDB, retrieve a list of all orders, along with the related customer, 
product and employee details. For each order, display: 
					1. order ID
					2. customer's name
					3. product name
					4. saled amount
					5. product price
					6. Saleperson's name 
*/
USE SalesDB
SELECT 
	o.OrderID,
	o.Sales,
	c.FirstName as CustomerFirstName,
	c.LastName AS CustomerLastame,
	p.Product as ProductName,
	p.Price,
	e.FirstName AS EmployeeFirstName,
	e.LastName AS EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
On o.SalesPersonID = e.EmployeeID