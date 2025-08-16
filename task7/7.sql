-- Drop tables if they exist
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Orders;

-- Drop views if they exist
DROP VIEW IF EXISTS CustomerOrderCount;
DROP VIEW IF EXISTS HighValueOrders;
DROP VIEW IF EXISTS CustomerSpending;

-- Create Customers table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product TEXT,
    amount REAL,
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

-- Insert sample data into Customers
INSERT INTO Customers (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');

-- Insert sample data into Orders
INSERT INTO Orders (customer_id, product, amount) VALUES
(1, 'Laptop', 1200),
(1, 'Mouse', 25),
(2, 'Keyboard', 45),
(3, 'Monitor', 300);

---------------------------------------------------------
-- Creating Views
---------------------------------------------------------

-- 1. View: Customer Order Count
CREATE VIEW CustomerOrderCount AS
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 2. View: High Value Orders (>100)
CREATE VIEW HighValueOrders AS
SELECT o.order_id, c.name, o.product, o.amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.amount > 100;

-- 3. View: Customer Spending Summary
CREATE VIEW CustomerSpending AS
SELECT c.customer_id, c.name, SUM(o.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

---------------------------------------------------------
-- Usage Examples
---------------------------------------------------------

-- Show total orders per customer
SELECT * FROM CustomerOrderCount;

-- Show only high-value orders
SELECT * FROM HighValueOrders;

-- Show total spending per customer
SELECT * FROM CustomerSpending;
