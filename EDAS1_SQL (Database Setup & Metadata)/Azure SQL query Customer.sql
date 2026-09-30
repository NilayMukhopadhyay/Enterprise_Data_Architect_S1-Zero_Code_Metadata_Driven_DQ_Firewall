-- Table: Customer
DROP TABLE IF EXISTS [dbo].[Customer];

CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    LastModifiedDate DATETIME DEFAULT GETDATE()
);

INSERT INTO Customer (CustomerID, CustomerName, Region) VALUES
('C001', 'Aarav Sharma', 'East'),
('C002', 'Priya Patel', 'West'),
('C003', 'Rohan Gupta', 'North'),
('C004', 'Neha Singh', 'South'),
('C005', 'Vikram Verma', 'East');

-- Missing customer
('C999', 'Balaji Chandrashekhar', 'South');