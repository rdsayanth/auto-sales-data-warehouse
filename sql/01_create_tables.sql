/* Auto Sales data mart: create the database and star schema tables (SQL Server) */

CREATE DATABASE AutoWarehouse;
GO

USE AutoWarehouse;
GO

/* Date dimension */
CREATE TABLE Date_dim
(
    DateID   INT NOT NULL IDENTITY,
    FullDate DATE,
    Day      INT,
    Month    INT,
    Year     INT,
    PRIMARY KEY (DateID)
);
GO

/* Product dimension */
CREATE TABLE Product_dim
(
    ProductID   INT NOT NULL IDENTITY,
    ProductCode NVARCHAR(255),
    ProductLine NVARCHAR(255),
    MSRP        FLOAT,
    PRIMARY KEY (ProductID)
);
GO

/* Customer dimension */
CREATE TABLE Customer_dim
(
    CustomerID   INT NOT NULL IDENTITY,
    CustomerName NVARCHAR(255),
    City         NVARCHAR(255),
    Country      NVARCHAR(255),
    PRIMARY KEY (CustomerID)
);
GO

/* Sales fact table */
CREATE TABLE Sales_Fact
(
    ProductID   INT,
    CustomerID  INT,
    DateID      INT,
    OrderNumber INT,
    Quantity    INT,
    PriceEach   FLOAT,
    Sales       FLOAT,
    PRIMARY KEY (ProductID, CustomerID, DateID),
    FOREIGN KEY (ProductID)  REFERENCES Product_dim(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer_dim(CustomerID),
    FOREIGN KEY (DateID)     REFERENCES Date_dim(DateID)
);
GO
