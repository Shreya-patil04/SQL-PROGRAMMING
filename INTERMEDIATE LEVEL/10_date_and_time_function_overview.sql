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

-- 2. CONVERT()
SELECT
CONVERT(INT , '123') AS [String to Int CONVERT] , 
CONVERT(DATE, '2025-08-17') AS [String to Date CONVERT] ,
CreationTime , 
CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT],
CONVERT(VARCHAR, CreationTime, 32) AS [USA std. Style:32],
CONVERT(VARCHAR, CreationTime, 34) AS [EURO std. Style:34]
FROM Sales.Orders

-- 3. CAST()
SELECT
CAST('123' AS INT) AS [String to Int],
CAST(123 AS VARCHAR) AS [Int to String],
CAST('2025-08-23' AS DATE) AS [String to Date],
CAST('2025-08-23' AS DATETIME) AS [String to DateTime],
CreationTime,
CAST(CreationTime AS DATE) AS [DateTime to Date]
FROM Sales.Orders



-- CALCULATION FUNCTIONS: -
-- 1. DATEADD()
SELECT
OrderID,
OrderDate,
DATEADD(month, 3, OrderDate) AS Three_months_later,
DATEADD(year, 2, OrderDate) AS Two_years_later,
DATEADD(day, -10, OrderDate) AS Ten_days_before
FROM Sales.Orders

-- 2. DATEDIFF()
-- SQL TASK: Calculate the age of employees
SELECT 
EmployeeID,
BirthDate,
DATEDIFF(year, BirthDate, GETDATE()) Age
FROM Sales.Employees

-- SQL TASK: Find the shipping duration in days for each month
SELECT
MONTH(OrderDate) as OrderDate,
AVG(DATEDIFF(day, OrderDate, ShipDate)) day_to_ship
FROM Sales.Orders
GROUP BY MONTH(OrderDate) 

-- TIME TASK ANALYSIS
-- SQL TASK: Find the number of days between each order and previous order
SELECT
OrderId,
OrderDate CurrentOrderDate,
-- LAG() - window function
LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate ) Number_of_days
FROM Sales.Orders


-- VALIDATION FUNCTIONS: -
-- ISDATE()
SELECT 
ISDATE('123') Datecheck1,
ISDATE('2025-08-20') Datecheck2,
ISDATE('20-08-2025') Datecheck3,
ISDATE('2025') Datecheck4,
ISDATE('08') Datecheck5

SELECT '2025-0S-20' AS OrderDate UNION
SELECT 



