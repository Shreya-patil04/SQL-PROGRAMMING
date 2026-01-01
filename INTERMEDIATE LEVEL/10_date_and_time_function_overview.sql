USE SalesDB

-- PART EXTRACTION FUNCTIONS: -

--1. DAY()
SELECT
OrderID ,
CreationTime,
DAY(CreationTime) Day
FROM Sales.Orders

--2.MONTH()
SELECT
OrderID ,
CreationTime,
MONTH(CreationTime) Month
FROM Sales.Orders

--3. YEAR()
SELECT
OrderID ,
CreationTime,
YEAR(CreationTime) Year
FROM Sales.Orders

--4.DATEPART()
SELECT
OrderID ,
CreationTime,
DATEPART(year, CreationTime) year_dp,
DATEPART(month, CreationTime) month_dp,
DATEPART(day, CreationTime) day_dp,
DATEPART(hour, CreationTime) hours_dp,
DATEPART(minute, CreationTime) minute_dp,
DATEPART(second, CreationTime) second_dp,
DATEPART(quarter, CreationTime) quarter_dp,
DATEPART(week, CreationTime) week_dp,
YEAR(CreationTime) Year
FROM Sales.Orders

--5.DATENAME()
SELECT
OrderID ,
CreationTime,
DATENAME(year, CreationTime) year_dn,
DATENAME(month, CreationTime) month_dn,
DATENAME(weekday, CreationTime) day_dn,
YEAR(CreationTime) Year
FROM Sales.Orders

--6.DATETRUNC()
SELECT
OrderID ,
CreationTime,
DATETRUNC(minute, CreationTime) minute_dt,
YEAR(CreationTime) Year
FROM Sales.Orders
--or
SELECT
OrderID ,
CreationTime,
DATETRUNC(month, CreationTime) month_dt,
YEAR(CreationTime) Year
FROM Sales.Orders

--eg: 
SELECT
CreationTime,
COUNT(*)
FROM Sales.Orders
GROUP BY CreationTime
-- to just extract the date (month) in group from the above data we can use DATETRUNC()
SELECT
DATETRUNC(month,CreationTime) Creation,
COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(month,CreationTime)
-- to just extract the date (year) in group from the above data we can use DATETRUNC()
SELECT
DATETRUNC(year,CreationTime) Creation,
COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(year,CreationTime)

-- to set date to the first day of month
SELECT
OrderID ,
CreationTime,
DATETRUNC(Month, CreationTime) StartOfMonth
FROM Sales.Orders

--7.EOMONTH()
SELECT
OrderID ,
CreationTime,
EOMONTH(CreationTime) EndOfMonth
FROM Sales.Orders

-- USE CASE PART EXTRACTION: DATA AGREGATION
-- SQL TASK: How many orders were placed each year?
SELECT 
YEAR(OrderDate),
COUNT(*) NrOfOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)
-- SQL TASK: How many orders were placed each month?
SELECT 
DATENAME(MONTH, OrderDate) AS OrderDate,
COUNT(*) NrOfOrders
FROM Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate)

-- USE CASE PART EXTRACTION: DATA FILTERING
-- SQL TASK: Shpw all orders that were placed during the month of february
SELECT
*
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2



-- FORMAT AND CASTING FUNCTIONS: -
-- 1. FORMAT()
SELECT
OrderID ,
CreationTime,
FORMAT(CreationTime, 'MM-dd-yyyy' ) USA_standard,
FORMAT(CreationTime, 'dd--MM-yyyy' ) USA_standard,
--day
FORMAT(CreationTime, 'dd' ) dd,
FORMAT(CreationTime, 'ddd' ) ddd,
FORMAT(CreationTime, 'dddd' ) dddd,
--month
FORMAT(CreationTime, 'MM' ) MM,
FORMAT(CreationTime, 'MMM' ) MMM,
FORMAT(CreationTime, 'MMMM' ) MMMM
FROM Sales.Orders

--SQL TASK: Show CreationTime using the following format: Day Wed Jan Q1 2025 12:34:56 PM
SELECT
CreationTime,
'Day' + FORMAT(CreationTime, 'ddd MMM') + 'Q1' 
+ DATENAME(QUARTER, CreationTime) + ' ' 
+ FORMAT(CreationTime, 'yyyy hh:mm:ss tt') 
AS user_format
FROM Sales.Orders

-- USE CASE OF FORMATIING: DATA AGGREGATIONS
SELECT
FORMAT(OrderDate, 'MMM yy') OrderDate,
COUNT(*)
FROM sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy')

-- USE CASE OF FORMATIING: DATA STANDARISATION




