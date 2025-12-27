USE SalesDB

-- 1. Combine information:
/* SQL TASK: Orders are stored in seperate tables (orders and orderArchieve)
combine all order data into onw report without duplicate */
SELECT 
'Orders' AS SourceTable,
[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 
'OrdersArchieve' AS SourceTable,
[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive;


-- 2. Delta Detection: 
-- SQL TASK: 