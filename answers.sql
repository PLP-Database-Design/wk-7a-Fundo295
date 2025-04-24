-- Question 1 Achieving 1NF (First Normal Form)
-- 1NF version of ProductDetail table
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
SELECT 103, 'Emily Clark', 'Phone';
-- Question 2 Achieving 2NF (Second Normal Form)
-- Create Orders Table
CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    CustomerName varchar(100)
);
INSERT INTO Orders (OrderID, CustomerName)
SELECT OrderID, CustomerName
FROM OrderDetails
GROUP BY OrderID, CustomerName;
--  Create OrderProducts Table
CREATE TABLE OrderProducts (
    OrderID int,
    Product varchar(50),
    Quantity int,
    PRIMARY KEY (OrderID, Product)  -- assuming product can't be repeated in the same order for normalization
);
INSERT INTO OrderProducts (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;