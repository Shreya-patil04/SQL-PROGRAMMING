USE SalesDB

-- RULE 1: SQL CLAUSES
SELECT 
FirstName,
LastName
FROM Customers
-- join, where, group by
UNION

SELECT 
FirstName,
LastName
FROM Employees
-- join, where, group by

-- order by first name


-- RULE 2: NUMBER OF COLUMNS
SELECT 
FirstName,
LastName
FROM Sales.Customers

UNION

SELECT 
FirstName,
LastName
FROM Sales.Employees


-- RULE 3: DATA TYPES
SELECT 
FirstName,
LastName
FROM Sales.Customers

UNION

SELECT 
EmployeeID,
LastName
FROM Sales.Employees

-- RULE 4: ORDER OF COLUMNS
SELECT
LastName,
CustomerID
FROM Sales.Customers

UNION

SELECT 
EmployeeID,
LastName
FROM Sales.Employees