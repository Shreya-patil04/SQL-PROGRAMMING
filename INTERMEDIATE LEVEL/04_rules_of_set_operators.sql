USE SalesDB

-- RULE 1: SQL CLAUSES
SELECT 
FirstName,
LastName
FROM Sales.Customers
-- join, where, group by
UNION

SELECT 
FirstName,
LastName
FROM Sales.Employees
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


-- RULE 5: COLUMN ALIASES
SELECT
CustomerID as ID,
-- this is correct
LastName
FROM Sales.Customers

UNION

SELECT 
EmployeeID,
LastName as LAST_NAME
--this is wrong
FROM Sales.Employees


-- RULE 6: CORRECT COLUMS
SELECT
FirstName,
LastName
FROM Sales.Customers

UNION

SELECT 
LastName,
FirstName
FROM Sales.Employees
