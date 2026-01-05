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

