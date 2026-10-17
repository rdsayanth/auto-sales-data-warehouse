/* Stored procedures used as the datasets for the SSRS reports */

USE AutoWarehouse;
GO

-- Report 1 (tabular): items sold by product and month
CREATE PROC Report1
AS
SELECT
    SUM(sf.Quantity) AS [Items Sold],
    p.ProductCode    AS [Product Code],
    p.ProductLine    AS [Product Line],
    p.MSRP           AS [Product Price],
    d.Month,
    d.Year
FROM Sales_Fact sf
INNER JOIN Product_dim p ON sf.ProductID = p.ProductID
INNER JOIN Date_dim d    ON sf.DateID = d.DateID
GROUP BY p.ProductCode, p.ProductLine, p.MSRP, d.Month, d.Year;
GO

-- Report 2 (parameterised): total sales by product for one customer
CREATE PROC Report2
    @CustomerID INT
AS
SELECT
    SUM(sf.Sales) AS [Total Sales],
    p.ProductCode AS [Product Code],
    p.ProductLine AS [Product Line],
    c.CustomerName,
    c.City,
    c.Country
FROM Sales_Fact sf
INNER JOIN Product_dim p  ON sf.ProductID = p.ProductID
INNER JOIN Customer_dim c ON sf.CustomerID = c.CustomerID
WHERE c.CustomerID = @CustomerID
GROUP BY p.ProductCode, p.ProductLine, c.CustomerName, c.City, c.Country;
GO

-- Report 3 (matrix): sales by customer and product line
CREATE PROC Report3
AS
SELECT
    c.CustomerName AS [Customer Name],
    p.ProductCode  AS [Product Code],
    p.ProductLine  AS [Product Line],
    sf.Sales,
    sf.Quantity,
    d.Month,
    d.Year
FROM Date_dim d
INNER JOIN Sales_Fact sf  ON d.DateID = sf.DateID
INNER JOIN Customer_dim c ON sf.CustomerID = c.CustomerID
INNER JOIN Product_dim p  ON sf.ProductID = p.ProductID;
GO

-- Example calls
EXEC Report1;
EXEC Report2 @CustomerID = 1;
EXEC Report3;
