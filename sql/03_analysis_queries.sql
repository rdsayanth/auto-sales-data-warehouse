USE AutoWarehouse
GO
select Product_dim.*
from Product_dim 

--1 Print product table

SELECT * FROM Product_dim;

--2  SQL Query to Retrieve All Customer Records from the USA
SELECT * FROM Customer_dim WHERE Country = 'USA';

--3 Count of Sales for ProductID 1
SELECT COUNT(*) FROM Sales_Fact WHERE ProductID = 1;

--4 SQL Query to Summarize Total Sales by Customer
SELECT CustomerID, SUM(Sales) as TotalSales FROM Sales_Fact GROUP BY CustomerID;

--5 Customer Counts by City
SELECT City, COUNT(*) AS CustomerCount
FROM Customer_dim
GROUP BY City
ORDER BY City;

--6 Sales Report: Top 100 Customers with Product Details
SELECT TOP 100 c.CustomerName, p.ProductCode, p.ProductLine, s.OrderNumber, s.Quantity, s.PriceEach
FROM Customer_dim c
JOIN Sales_Fact s ON c.CustomerID = s.CustomerID
JOIN Product_dim p ON s.ProductID = p.ProductID;

--7 Customer Count by City
SELECT c.City, COUNT(*) AS CustomerCount
FROM Customer_dim c
GROUP BY c.City
ORDER BY c.City;

--8 Yearly Count Summary
SELECT Year, COUNT(*) AS YearCount
FROM Date_dim
GROUP BY Year
ORDER BY Year;

--9 Top 5 Customers by Total Quantity Purchased"
SELECT TOP 5 c.CustomerID, SUM(s.Quantity) AS TotalQuantity
FROM Customer_dim c
JOIN Sales_Fact s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalQuantity DESC;


--10 Customer Names and Cities for Product ID 1
SELECT DISTINCT c.CustomerName, c.City
FROM Customer_dim c
JOIN Sales_Fact s ON c.CustomerID = s.CustomerID
JOIN Product_dim p ON s.ProductID = p.ProductID
WHERE p.ProductID = 1;













