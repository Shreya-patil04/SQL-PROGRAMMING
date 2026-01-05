USE SalesDB

-- CASE STATEMENTS USE CASES

-- 1. CATEGORISING DATA: -
/* SQL TASK: Generate a report showing the total sales for each category
	high : if the sales higher than 50
	medium : if the sales between 20 and 50
	low : if the sales equal or lower than 20 
Sort the result from lowest to highest */
SELECT
Category,
SUM(Sales) AS total_sales
FROM(
	SELECT 
	OrderID,
	Sales,
	CASE
		WHEN Sales > 50 THEN 'High'
		WHEN Sales > 20 THEN 'Medium' 
		ELSE 'Low' 
	END Category
	FROM Sales.Orders
) t
GROUP BY Category
ORDER BY total_sales DESC


-- 2.MAPPING DATA: -
-- SQL TASK: Retrieve employee details with gender displayed as full text
SELECT
EmployeeID,
FirstName,
LastName,
Gender,
CASE
	WHEN Gender = 'F' THEN 'Female'
	WHEN Gender = 'M' THEN 'Male'
	ELSE 'Not available'
END GenderFullText
FROM Sales.Employees

-- SQL TASK: Retrieve customer details with abbreviated country code
SELECT
CustomerID,
FirstName,
LastName,
Country,
CASE
	WHEN Country = 'Germany' THEN 'DE'
	WHEN Country = 'USA' THEN 'US'
	ELSE 'Not available'
END CountryAbbreviation
FROM Sales.Customers
-- or using quick form we can write it as: 
SELECT
CustomerID,
FirstName,
LastName,
Country,
CASE Country
	WHEN 'Germany' THEN 'DE'
	WHEN 'USA' THEN 'US'
	ELSE 'Not available'
END CountryAbbreviation
FROM Sales.Customers


-- 3. HANDLING NULLS: -
/* SQL TASK: FInd the average score of customers and treat Nulls as '0'
and provide additional details such as customerID & LastName */
SELECT
CustomerID,
LastName,
Score,
CASE
	WHEN Score IS NULL THEN 0 
	ELSE Score
END ScoreClean,
AVG(CASE
	WHEN Score IS NULL THEN 0 
	ELSE Score
	END ) OVER() AvgCustomerClean,

AVG(Score) OVER() AvgCustomer
FROM Sales.Customers


-- 4. CONDITIONAL AGGREGATION: -
-- SQL TASK: Count how many times each customer has made an order with sales greater than 30
SELECT 
CustomerID,
SUM(CASE
	WHEN Sales> 30 THEN 1
	ELSE 0
END) TotalOrders,
COUNT(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerID