-- Drop tables if they exist
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Create Customers table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product TEXT NOT NULL,
    amount REAL NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert sample data into Customers
INSERT INTO Customers (customer_id, name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com'),
(4, 'David', 'david@example.com');

-- Insert sample data into Orders
INSERT INTO Orders (order_id, customer_id, product, amount) VALUES
(101, 1, 'Laptop', 1200.00),
(102, 1, 'Mouse', 25.00),
(103, 2, 'Keyboard', 45.00),
(104, 4, 'Monitor', 200.00);

------------------------------------------------------
-- 1. Scalar Subquery in SELECT
------------------------------------------------------
SELECT 
    name,
    (SELECT COUNT(*) FROM Orders WHERE Orders.customer_id = Customers.customer_id) AS total_orders
FROM Customers;

------------------------------------------------------
-- 2. Subquery in WHERE with IN
------------------------------------------------------
SELECT name, email
FROM Customers
WHERE customer_id IN (
    SELECT customer_id FROM Orders WHERE amount > 100
);

------------------------------------------------------
-- 3. Subquery in WHERE with EXISTS
------------------------------------------------------
SELECT name
FROM Customers c
WHERE EXISTS (
    SELECT 1 FROM Orders o WHERE o.customer_id = c.customer_id
);

------------------------------------------------------
-- 4. Subquery in FROM Clause
------------------------------------------------------
SELECT customer_id, AVG(amount) AS avg_amount
FROM (
    SELECT customer_id, amount FROM Orders
) AS sub
GROUP BY customer_id;

------------------------------------------------------
-- 5. Correlated Subquery
------------------------------------------------------
SELECT name, email
FROM Customers c
WHERE 500 < (
    SELECT SUM(amount) 
    FROM Orders o 
    WHERE o.customer_id = c.customer_id
);
