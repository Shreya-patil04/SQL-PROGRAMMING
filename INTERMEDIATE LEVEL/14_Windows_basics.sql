use SalesDB

-- Window Basics

-- SQL TASK: Find the total sales across all orders
SELECT
SUM(Sales) TotalSales
FROM Sales.Orders

-- SQL TASK: Find the total sales for each product
SELECT
ProductID,
SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID
--the number of rows is defined by the dimension

-- SQL TASK: Find the total sales for each product
-- Additionally provide details such as orderid and order date
SELECT
OrderID,
OrderDate,
ProductID,
SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY OrderID, OrderDate, ProductID

-- Using window functions
SELECT
ProductID,
OrderID,
OrderDate,
SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
FROM Sales.Orders


-- SQL TASK: 



-- SQL TASK: 



-- SQL TASK: 



-- SQL TASK: 
-- SQL TASK: 
-- SQL TASK: 
-- SQL TASK: 