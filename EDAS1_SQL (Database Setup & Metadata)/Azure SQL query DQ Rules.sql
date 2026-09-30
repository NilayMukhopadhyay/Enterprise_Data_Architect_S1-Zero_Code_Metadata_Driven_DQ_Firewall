-- Table: Data Quality Rules
DROP TABLE IF EXISTS [dbo].[dq_rules];

CREATE TABLE dq_rules (
    RuleID VARCHAR(10) PRIMARY KEY,
    DatasetName VARCHAR(50),
    ColumnName VARCHAR(50),
    RuleType VARCHAR(50),
    ThresholdValue VARCHAR(50),
    Action VARCHAR(20),
    ActiveFlag BIT,
    RejectionReason VARCHAR(50),
    LastModifiedDate DATETIME DEFAULT GETDATE()
);

INSERT INTO dq_rules (RuleID, DatasetName, ColumnName, RuleType, ThresholdValue, Action, ActiveFlag, RejectionReason) VALUES
('DQ001', 'Orders', 'Quantity', 'GreaterThan', '0', 'QUARANTINE', 1, 'Negative_Qty'),
('DQ002', 'Orders', 'CustomerID', 'IsNotNull', 'NULL', 'QUARANTINE', 1, 'Null_CustomerID'),
('DQ003', 'Orders', 'CustomerID', 'ExistsInRef', 'Customer', 'PENDING', 1, 'Missing_Cust_Ref'),
('DQ004', 'Orders', 'Quantity', 'LessThanOrEqual', '50', 'WARN', 1, 'Qty_Limit_Exceeded'), 
('DQ005', 'Orders', 'DiscountPercent', 'LessThanOrEqual', '10', 'QUARANTINE', 1, 'Discount_Limit_Exceeded');


-- Discount update
UPDATE dbo.dq_rules
SET 
    ThresholdValue = '35',
    LastModifiedDate = GETDATE()
WHERE RuleID = 'DQ005';
