-- Table: Orders 
DROP TABLE IF EXISTS [dbo].[Orders];

CREATE TABLE Orders (
    OrderID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10),
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    DiscountPercent INT,
    LastModifiedDate DATETIME DEFAULT GETDATE()
);

-- 1st batch
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Quantity, TotalAmount, DiscountPercent) VALUES
('O1001', 'C001', '2026-09-18', 5, 2500.00, 5),
('O1002', 'C002', '2026-09-18', 2, 1000.00, 0),
('O1003', NULL,   '2026-09-18', 1, 500.00, 0),
('O1004', 'C003', '2026-09-18', 10, 8000.00, 10),
('O1005', 'C004', '2026-09-18', -2, 1500.00, 5),
('O1006', 'C005', '2026-09-18', 500, 75000.00, 0),
('O1007', 'C999', '2026-09-18', 3, 3000.00, 5),
('O1008', 'C001', '2026-09-18', 4, 2000.00, 10),
('O1009', 'C002', '2026-09-18', 1, 500.00, 0),
('O1010', 'C003', '2026-09-18', 6, 4500.00, 5);

-- 2nd batch
-- Good records
('O2001', 'C001', '2026-09-25', 5, 2500.00, 5), 
('O2002', 'C002', '2026-09-25', 2, 1000.00, 0),
('O2003', 'C003', '2026-09-25', 4, 2000.00, 10),
('O2004', 'C004', '2026-09-25', 1, 500.00, 8),

-- Bad records
('O2005', 'C005', '2026-09-25', 10, 8000.00, 15), 
('O2006', 'C001', '2026-09-25', 3, 1500.00, 20),
('O2007', 'C002', '2026-09-25', 6, 3000.00, 25),
('O2008', 'C003', '2026-09-25', 2, 1200.00, 12),
('O2009', 'C004', '2026-09-25', 5, 4000.00, 18),
('O2010', 'C005', '2026-09-25', 1, 800.00, 30);

-- Run 4: Business Team Resolution for initial Quarantined Records
-- Fixing NULL CustomerID for O1003
UPDATE dbo.Orders
SET 
    CustomerID = 'C003',
    LastModifiedDate = GETDATE()
WHERE OrderID = 'O1003';

-- Fixing Negative Quantity for O1005
UPDATE dbo.Orders
SET 
    Quantity = 2,
    LastModifiedDate = GETDATE()
WHERE OrderID = 'O1005';

-- 3rd or last batch
('O3001', 'C002', '2026-09-29', 3, 1800.00, 8),
('O3002', 'C004', '2026-09-29', 7, 4200.00, 12),
('O3003', 'C001', '2026-09-29', 2, 1500.00, 5),
('O3004', 'C005', '2026-09-29', 5, 3500.00, 15),
('O3005', 'C003', '2026-09-29', 12, 9000.00, 32);


