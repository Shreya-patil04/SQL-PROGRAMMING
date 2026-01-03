USE SalesDB

-- NULL FUNCTIONS: 

-- 1. DATA AGGREGATION: -
-- SQL TASK: Find the average scores of the customers
SELECT
CustomerID,
Score,
COALESCE(Score, 0) AS Updated_Score,
AVG(Score) OVER () AS AvgScores,
AVG(COALESCE(Score, 0)) OVER () AS AvgScores2
FROM Sales.Customers


-- 2. MATHEMATICAL OPERATIONS: -
/* SQL TASK: Display the full name of the customer in a single field
by merging their first & last names,
and add 10 bonus points to each customer's score */
SELECT
CustomerID,
FirstName,
LastName,
FirstName + ' ' + COALESCE(LastName, ' ' ) AS FullName,
Score,
COALESCE(Score, 0) + 10 AS Score_With_Bonus
FROM Sales.Customers


-- 4. SORTING DATA: -
-- SQL TASK: Sort the customers from the lowest to highest scores, with NULLS appearing last
SELECT
CustomerID,
Score
FROM Sales.Customers
ORDER BY Score

-- METHOD 1: Replace the NULLS with very big number
SELECT
CustomerID,
Score,
COALESCE(Score, 9999999)
FROM Sales.Customers
ORDER BY COALESCE(Score, 9999999)

-- Method 2: Using flags
SELECT
CustomerID,
Score
FROM Sales.Customers
ORDER BY CASE WHEN score IS NULL THEN 1 ELSE 0 END, Score


-- 5. PREVENTING THE ERROR OF DIVIDING BY ZEO
-- SQL TASK: Find the sales price for each order by dividing sales by quantity
SELECT
OrderID,
Sales,
Quantity,
Sales / NULLIF(Quantity,0) AS Price
FROM Sales.Orders


-- 6. FLITERING DATA: -
-- SQL TASK: Identify the customers who have no scores
SELECT 
*
FROM Sales.Customers
WHERE Score IS NULL

-- SQL TASK: Show a list of all customers who have scores
SELECT 
*
FROM Sales.Customers
WHERE Score IS NOT NULL


-- 6. ANTI JOINS: -
-- SQL TASK: List all details for customers who have not placed any orders
SELECT
c.*,
o.OrderID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
-- left anti join: All rows from left table without matches in the right table
WHERE o.CustomerID IS NULL 