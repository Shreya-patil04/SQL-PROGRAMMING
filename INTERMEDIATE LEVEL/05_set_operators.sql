USE SalesDB

-- 1. UNION
-- SQL TASK: Combine the data from the employees and customers into one table
SELECT 
FirstName,
LastName
From Sales.Customers
UNION
SELECT 
FirstName,
LastName
From Sales.Employees;


-- 2. UNION ALL
-- SQL TASK: Combine the data from the employees and customers into one table, including the duplicates
SELECT 
FirstName,
LastName
From Sales.Customers
UNION ALL 
SELECT 
FirstName,
LastName
From Sales.Employees;

-- 3. EXCEPT
-- SQL TASK: Find employees who are not customers at the same time
SELECT 
FirstName,
LastName
From Sales.Employees
-- table 2
EXCEPT
SELECT 
FirstName,
LastName
From Sales.Customers;
-- table 1


-- 4. INTERSECT
-- SQL TASK: Find the employees, who are also customers
SELECT 
FirstName,
LastName
From Sales.Employees
-- table 2
INTERSECT
SELECT 
FirstName,
LastName
From Sales.Customers;
-- table 1


-- 