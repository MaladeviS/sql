-- Drop tables if exist
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

-- Insert sample data
INSERT INTO Customers (customer_id, name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com');

INSERT INTO Orders (order_id, customer_id, product, amount) VALUES
(101, 1, 'Laptop', 1200.00),
(102, 1, 'Mouse', 25.00),
(103, 2, 'Keyboard', 45.00),
(104, 4, 'Monitor', 200.00); -- customer_id=4 does not exist in Customers

-- INNER JOIN: Matching customers with orders
SELECT Customers.customer_id, Customers.name, Orders.product, Orders.amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- LEFT JOIN: All customers, even without orders
SELECT Customers.customer_id, Customers.name, Orders.product, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- RIGHT JOIN: All orders, even if customer missing
SELECT Customers.customer_id, Customers.name, Orders.product, Orders.amount
FROM Customers
RIGHT JOIN Orders 
 ON Customers.customer_id = Orders.customer_id;

-- FULL JOIN: All customers and all orders
SELECT Customers.customer_id, Customers.name, Orders.product, Orders.amount
FROM Customers
FULL JOIN Orders 
ON Customers.customer_id = Orders.customer_id;


