-- Step 1: Drop tables if they already exist
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Step 2: Create Customers table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_name TEXT NOT NULL,
    email TEXT UNIQUE
);

-- Step 3: Create Orders table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    product TEXT,
    amount REAL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Step 4: Insert sample data
INSERT INTO Customers (customer_name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');

INSERT INTO Orders (customer_id, product, amount) VALUES
(1, 'Laptop', 75000),
(1, 'Mouse', 1200),
(2, 'Keyboard', 2500),
(3, 'Monitor', 15000),
(1, 'Headphones', 3500);

-- ===============================
-- "Stored Procedure" Simulation
-- (Using a VIEW instead of PROCEDURE)
-- ===============================
CREATE VIEW GetCustomerOrders AS
SELECT c.customer_id, c.customer_name, o.product, o.amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- Usage:
-- SELECT * FROM GetCustomerOrders WHERE customer_id = 1;

-- ===============================
-- "Stored Function" Simulation
-- (Using a TRIGGER or aggregate query)
-- ===============================
-- Create a view to count total orders per customer
CREATE VIEW GetTotalOrders AS
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id;

-- Usage:
-- SELECT total_orders FROM GetTotalOrders WHERE customer_id = 1;
