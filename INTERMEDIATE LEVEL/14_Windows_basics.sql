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
SELECT
OrderID,
OrderDate,
Sales,
RANK()  OVER (ORDER BY Sales DESC ) RankSales
FROM Sales.Orders

--for lowest to highest use ASC
SELECT
OrderID,
OrderDate,
Sales,
RANK()  OVER (ORDER BY Sales ASC ) RankSales
FROM Sales.Orders

-- WINDOW FRAMES: 

--example: -
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY OrderStatus 
        ORDER BY OrderDate 
        -- frame defined below
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
) AS Total_Sales
FROM Sales.Orders;

SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY OrderStatus 
        ORDER BY OrderDate 
        -- frame defined below
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW 
    ) AS Total_Sales
FROM Sales.Orders;

-- DEFAULT FRAME: -
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY OrderStatus 
        ORDER BY OrderDate 
        -- default frame below ->
        -- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 

    ) AS Total_Sales
FROM Sales.Orders;


-- SQL TASK: Find the total sakes for each order status, only for two products 101 and 102 
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (PARTITION BY OrderStatus) AS Total_Sales
FROM Sales.Orders
WHERE ProductID IN (101,102)

-- Calculate Total Sales by Order Status for current and previous two orders 
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY OrderStatus 
        ORDER BY OrderDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS Total_Sales
FROM Sales.Orders;

/* TASK 9: 
   Calculate Total Sales by Order Status from previous two orders only 
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY OrderStatus 
        ORDER BY OrderDate 
        ROWS 2 PRECEDING
    ) AS Total_Sales
FROM Sales.Orders;

/* TASK 10: 
   Calculate cumulative Total Sales by Order Status up to the current order 
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY OrderStatus 
        ORDER BY OrderDate 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Total_Sales
FROM Sales.Orders;

/* TASK 11: 
   Calculate cumulative Total Sales by Order Status from the start to the current row 
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY OrderStatus 
        ORDER BY OrderDate 
        ROWS UNBOUNDED PRECEDING
    ) AS Total_Sales
FROM Sales.Orders;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | RULES
===============================================================================*/

/* RULE 1: 
   Window functions can only be used in SELECT or ORDER BY clauses 
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (PARTITION BY OrderStatus) AS Total_Sales
FROM Sales.Orders
WHERE SUM(Sales) OVER (PARTITION BY OrderStatus) > 100;  -- Invalid: window function in WHERE clause

/* RULE 2: 
   Window functions cannot be nested 
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(SUM(Sales) OVER (PARTITION BY OrderStatus)) OVER (PARTITION BY OrderStatus) AS Total_Sales  -- Invalid nesting
FROM Sales.Orders;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | GROUP BY
===============================================================================*/

/* TASK 12: 
   Rank customers by their total sales 
*/
SELECT
    CustomerID,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Rank_Customers
FROM Sales.Orders
GROUP BY CustomerID;