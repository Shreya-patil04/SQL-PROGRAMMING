USE SalesDB
-- DATE AND TIME FUNCTIONS

-- basic example: 
SELECT
OrderID ,
OrderDate ,
ShipDate ,
CreationTime 
FROM Sales.Orders

-- DATE AND TIME VALUES: -

-- 1. Date column from the table:
SELECT
OrderID ,
CreationTime 
FROM Sales.Orders

-- 2. Hardcoded Constant String Value:
SELECT
OrderID ,
CreationTime,
'2025-08-20' Hardcoded
FROM Sales.Orders

-- 3. GETDATE() function: 
SELECT
OrderID ,
CreationTime,
'2025-08-20' Hardcoded ,
GETDATE() Today
FROM Sales.Orders