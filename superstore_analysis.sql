-- ==========================================
-- Superstore Sales Analysis
-- ==========================================

USE Superstore;

------------------------------------------------
-- 1. Preview Dataset
------------------------------------------------
SELECT * 
FROM dbo.train;

------------------------------------------------
-- 2. Dataset Overview
------------------------------------------------

-- Total records and unique orders
SELECT 
COUNT(*) AS Total_Records,
COUNT(DISTINCT order_id) AS Unique_Orders
FROM dbo.train;

-- Total Sales
SELECT 
SUM(Sales) AS Total_Sales
FROM dbo.train;

-- Total Categories
SELECT 
COUNT(DISTINCT Category) AS Total_Categories
FROM dbo.train;

------------------------------------------------
-- 3. Sales Analysis by State
------------------------------------------------

-- Bottom 5 states by sales
SELECT TOP 5 
State,
SUM(Sales) AS Total_Sales
FROM dbo.train
GROUP BY State
ORDER BY Total_Sales ASC;

-- Top 5 states by sales
SELECT TOP 5 
State,
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM dbo.train
GROUP BY State
ORDER BY Total_Sales DESC;

------------------------------------------------
-- 4. Sales by Sub-Category
------------------------------------------------

-- Top 10 sub-categories
SELECT TOP 10 
Sub_category,
SUM(Sales) AS Total_Sales
FROM dbo.train
GROUP BY Sub_category
ORDER BY Total_Sales DESC;

-- Bottom 10 sub-categories
SELECT TOP 10 
Sub_category,
SUM(Sales) AS Total_Sales
FROM dbo.train
GROUP BY Sub_category
ORDER BY Total_Sales ASC;

------------------------------------------------
-- 5. Date Analysis
------------------------------------------------

-- Minimum and Maximum Order Date
SELECT 
MAX(order_date) AS Latest_Order,
MIN(order_date) AS Earliest_Order
FROM dbo.train;

-- Sales by Year
SELECT 
YEAR(order_date) AS Year,
SUM(Sales) AS Total_Sales
FROM dbo.train
GROUP BY YEAR(order_date)
ORDER BY Total_Sales DESC;

------------------------------------------------
-- 6. Data Quality Check
------------------------------------------------

-- Check for NULL values in category
SELECT 
SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS Null_Category_Count
FROM dbo.train;

------------------------------------------------
-- 7. High Value Orders
------------------------------------------------

SELECT 
order_id,
SUM(Sales) AS Total_Sales
FROM dbo.train
WHERE Sales > 1000
GROUP BY order_id;

------------------------------------------------
-- 8. Sales by Sub-Category
------------------------------------------------

SELECT 
sub_category,
COUNT(order_id) AS Total_Orders,
ROUND(SUM(Sales),2) AS Total_Sales
FROM dbo.train
GROUP BY sub_category
ORDER BY Total_Sales DESC;

------------------------------------------------
-- 9. Sales by Segment
------------------------------------------------

SELECT 
segment,
CAST(SUM(Sales) AS DECIMAL(10,3)) AS Total_Sales
FROM dbo.train
GROUP BY segment;
