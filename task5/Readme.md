\# SQL Joins Example – Customers \& Orders



This project demonstrates how to use \*\*INNER JOIN\*\*, \*\*LEFT JOIN\*\*, \*\*RIGHT JOIN\*\*, and \*\*FULL JOIN\*\* in SQL using two related tables: `Customers` and `Orders`.



---



\## 📋 Database Schema



\### Table: `Customers`

| Column       | Type    | Description                    |

|--------------|---------|--------------------------------|

| customer\_id  | INTEGER | Primary Key, unique identifier |

| name         | TEXT    | Customer's name               |

| email        | TEXT    | Customer's email address      |



\### Table: `Orders`

| Column       | Type    | Description                    |

|--------------|---------|--------------------------------|

| order\_id     | INTEGER | Primary Key, unique identifier |

| customer\_id  | INTEGER | Foreign Key referencing `Customers(customer\_id)` |

| product      | TEXT    | Product name                   |

| amount       | REAL    | Order amount                   |



\*\*Relationship:\*\*  

`Customers` \*\*1 → Many\*\* `Orders` (One customer can have multiple orders)



---



\## 🛠 SQL Script



\### 1️⃣ Drop existing tables (if any)

```sql

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Customers;

2️⃣ Create Customers table

sql

Copy

Edit

CREATE TABLE Customers (

&nbsp;   customer\_id INTEGER PRIMARY KEY,

&nbsp;   name TEXT NOT NULL,

&nbsp;   email TEXT

);

3️⃣ Create Orders table

sql

Copy

Edit

CREATE TABLE Orders (

&nbsp;   order\_id INTEGER PRIMARY KEY,

&nbsp;   customer\_id INTEGER,

&nbsp;   product TEXT NOT NULL,

&nbsp;   amount REAL NOT NULL,

&nbsp;   FOREIGN KEY (customer\_id) REFERENCES Customers(customer\_id)

);

4️⃣ Insert sample data

sql

Copy

Edit

INSERT INTO Customers (customer\_id, name, email) VALUES

(1, 'Alice', 'alice@example.com'),

(2, 'Bob', 'bob@example.com'),

(3, 'Charlie', 'charlie@example.com');



INSERT INTO Orders (order\_id, customer\_id, product, amount) VALUES

(101, 1, 'Laptop', 1200.00),

(102, 1, 'Mouse', 25.00),

(103, 2, 'Keyboard', 45.00),

(104, 4, 'Monitor', 200.00); -- customer\_id=4 does not exist in Customers

🔍 Join Examples

1\. INNER JOIN – Matching customers with orders

sql

Copy

Edit

SELECT Customers.customer\_id, Customers.name, Orders.product, Orders.amount

FROM Customers

INNER JOIN Orders ON Customers.customer\_id = Orders.customer\_id;

✅ Returns rows where there is a match in both tables.



2\. LEFT JOIN – All customers, even without orders

sql

Copy

Edit

SELECT Customers.customer\_id, Customers.name, Orders.product, Orders.amount

FROM Customers

LEFT JOIN Orders ON Customers.customer\_id = Orders.customer\_id;

✅ Returns all customers, with NULL for orders if none exist.



3\. RIGHT JOIN – All orders, even if customer missing

sql

Copy

Edit

SELECT Customers.customer\_id, Customers.name, Orders.product, Orders.amount

FROM Customers

RIGHT JOIN Orders ON Customers.customer\_id = Orders.customer\_id;

✅ Returns all orders, with NULL for customer details if not found.



4\. FULL JOIN – All customers and all orders

sql

Copy

Edit

SELECT Customers.customer\_id, Customers.name, Orders.product, Orders.amount

FROM Customers

FULL JOIN Orders ON Customers.customer\_id = Orders.customer\_id;

✅ Returns all records from both tables, matching where possible.



📊 ER Diagram

scss

Copy

Edit

Customers (1) ──────────< (Many) Orders

Diagram details:



Primary Key: customer\_id in Customers, order\_id in Orders



Foreign Key: Orders.customer\_id → Customers.customer\_id



Relationship: One customer can place multiple orders.





