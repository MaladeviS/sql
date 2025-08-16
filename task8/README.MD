\# Task 8: Stored Procedures and Functions



\## 🎯 Objective

Learn to create and use reusable SQL blocks such as \*\*Stored Procedures\*\* and \*\*Functions\*\*.



\## 🛠 Tools

\- DB Browser for SQLite  

\- MySQL Workbench  



\## 📦 Deliverables

\- At least \*\*one stored procedure\*\*  

\- At least \*\*one function\*\*  



---



\## 📝 Example SQL Queries (MySQL)



\### 1️⃣ Stored Procedure: Get Orders by Customer

```sql

DELIMITER //



CREATE PROCEDURE GetCustomerOrders(IN cust\_id INT)

BEGIN

&nbsp;   SELECT order\_id, order\_date, total\_amount

&nbsp;   FROM Orders

&nbsp;   WHERE customer\_id = cust\_id;

END //



DELIMITER ;



