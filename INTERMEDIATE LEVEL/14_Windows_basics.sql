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

-- WINDOW SYNTAX: -

--1. partition by

-- SQL TASK: Find the total sales across all orders 
-- additionally provide details such as order ID, order date
SELECT
OrderID,
OrderDate,
SUM(Sales) OVER() TotalSales
FROM Sales.Orders

-- SQL TASK: Find the total sales for each product
-- additionally provide details such as order ID, order date
SELECT
OrderID,
OrderDate,
ProductID,
SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesEachProduct
FROM Sales.Orders


/*SQL TASK: Find the total sales across all orders 
Find the total sales for each product
additionally provide details such as order ID, order Date */
SELECT
OrderID,
OrderDate,
ProductID,
Sales,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesEachProduct
FROM Sales.Orders

/* SQL TASK: Find the total sales across all orders 
Find the total sales for each product
Find the total sales for each combination of product and order status 
additionally provide details such as order ID, order Date */
SELECT
OrderID,
OrderDate,
ProductID,
OrderStatus,
Sales,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesEachProduct,
SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus ) SalesByProductAndStatus
FROM Sales.Orders


-- 2. order by 

-- SQL TASK: rank each order based on their sales from highest to lowest
-- additionally provide details such as order ID, order Date */




-- SQL TASK: 
-- SQL TASK: 
-- SQL TASK: 