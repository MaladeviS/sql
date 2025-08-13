\# SQL Subqueries Example – Customers \& Orders



This project demonstrates different types of \*\*SQL subqueries\*\* using two related tables: \*\*Customers\*\* and \*\*Orders\*\*.  

The examples are designed to run in \*\*SQLite\*\*.



---



\## 📂 Tables Structure



\### 1. Customers Table

| Column Name | Data Type | Description |

|-------------|-----------|-------------|

| customer\_id | INTEGER (PK) | Unique customer ID |

| name        | TEXT       | Customer name (required) |

| email       | TEXT       | Email address |



\### 2. Orders Table

| Column Name | Data Type | Description |

|-------------|-----------|-------------|

| order\_id    | INTEGER (PK) | Unique order ID |

| customer\_id | INTEGER (FK) | Links to Customers table |

| product     | TEXT       | Product name |

| amount      | REAL       | Price of the product |



---



\## 🛠 SQL Script



```sql

-- Drop tables if they exist

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Customers;



-- Create Customers table

CREATE TABLE Customers (

&nbsp;   customer\_id INTEGER PRIMARY KEY,

&nbsp;   name TEXT NOT NULL,

&nbsp;   email TEXT

);



-- Create Orders table

CREATE TABLE Orders (

&nbsp;   order\_id INTEGER PRIMARY KEY,

&nbsp;   customer\_id INTEGER,

&nbsp;   product TEXT NOT NULL,

&nbsp;   amount REAL NOT NULL,

&nbsp;   FOREIGN KEY (customer\_id) REFERENCES Customers(customer\_id)

);



-- Insert sample Customers

INSERT INTO Customers (customer\_id, name, email) VALUES

(1, 'Alice', 'alice@example.com'),

(2, 'Bob', 'bob@example.com'),

(3, 'Charlie', 'charlie@example.com'),

(4, 'David', 'david@example.com');



-- Insert sample Orders

INSERT INTO Orders (order\_id, customer\_id, product, amount) VALUES

(101, 1, 'Laptop', 1200.00),

(102, 1, 'Mouse', 25.00),

(103, 2, 'Keyboard', 45.00),

(104, 4, 'Monitor', 200.00);

🔍 Subquery Examples

1\. Scalar Subquery in SELECT

Returns each customer's total number of orders.



sql

Copy

Edit

SELECT 

&nbsp;   name,

&nbsp;   (SELECT COUNT(\*) 

&nbsp;    FROM Orders 

&nbsp;    WHERE Orders.customer\_id = Customers.customer\_id) AS total\_orders

FROM Customers;

Result: One row per customer, with total orders as an extra column.



2\. Subquery in WHERE with IN

Finds customers who have placed orders worth more than 100.



sql

Copy

Edit

SELECT name, email

FROM Customers

WHERE customer\_id IN (

&nbsp;   SELECT customer\_id 

&nbsp;   FROM Orders 

&nbsp;   WHERE amount > 100

);

Result: Only customers with high-value orders.



3\. Subquery in WHERE with EXISTS

Returns customers who have at least one order.



sql

Copy

Edit

SELECT name

FROM Customers c

WHERE EXISTS (

&nbsp;   SELECT 1 

&nbsp;   FROM Orders o 

&nbsp;   WHERE o.customer\_id = c.customer\_id

);

Result: Excludes customers with no orders.



4\. Subquery in FROM Clause

Calculates the average order amount for each customer.



sql

Copy

Edit

SELECT customer\_id, AVG(amount) AS avg\_amount

FROM (

&nbsp;   SELECT customer\_id, amount 

&nbsp;   FROM Orders

) AS sub

GROUP BY customer\_id;

Result: One row per customer with their average spending.



5\. Correlated Subquery

Finds customers whose total spending exceeds 500.



sql

Copy

Edit

SELECT name, email

FROM Customers c

WHERE 500 < (

&nbsp;   SELECT SUM(amount) 

&nbsp;   FROM Orders o 

&nbsp;   WHERE o.customer\_id = c.customer\_id

);

Result: Filters customers based on their cumulative purchases.

