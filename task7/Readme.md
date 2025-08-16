-- See all customer order counts

SELECT \* FROM customer\_order\_count;



\## 🎯 Objective

Learn to create and use views in SQLite to simplify queries, improve abstraction, and provide security.



\## 🛠 Tools

\- DB Browser for SQLite  

\- SQLite CLI / MySQL Workbench (if MySQL is used)  



\## 📦 Database Schema



\### Customers Table

\- `customer\_id` (Primary Key)

\- `name`

\- `email`



\### Orders Table

\- `order\_id` (Primary Key)

\- `customer\_id` (Foreign Key → Customers.customer\_id)

\- `product`

\- `amount`



\### Relationship

\- One customer can have multiple orders (1-to-many).



\## 📊 ER Diagram

!\[ERD](sqlite\_views\_erd.png)



\## 📝 Sample Queries



\### 1. Create a View for Customer Order Count

```sql

CREATE VIEW customer\_order\_count AS

SELECT c.customer\_id, c.name, COUNT(o.order\_id) AS total\_orders

FROM Customers c

LEFT JOIN Orders o ON c.customer\_id = o.customer\_id

GROUP BY c.customer\_id, c.name;

2\. Create a View for High Value Orders

sql

Copy

Edit

CREATE VIEW high\_value\_orders AS

SELECT o.order\_id, c.name, o.product, o.amount

FROM Orders o

JOIN Customers c ON o.customer\_id = c.customer\_id

WHERE o.amount > 500;

3\. Create a View for Customer Spending

sql

Copy

Edit

CREATE VIEW customer\_spending AS

SELECT c.customer\_id, c.name, SUM(o.amount) AS total\_spent

FROM Customers c

JOIN Orders o ON c.customer\_id = o.customer\_id

GROUP BY c.customer\_id, c.name;

✅ Usage Examples

sql

Copy

Edit

-- See all customer order counts

SELECT \* FROM customer\_order\_count;



-- View high value orders (> 500)

SELECT \* FROM high\_value\_orders;



-- Check total spending per customer

SELECT \* FROM customer\_spending;

📌 Deliverables

SQL script with table creation, inserts, and views.



ER diagram (sqlite\_views\_erd.p)

