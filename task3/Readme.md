\# Task 3: Writing Basic SELECT Queries



\## 📝 Objective:

Extract data from one or more tables using basic SQL `SELECT` queries.



---



\## 🛠 Tools Used:

\- DB Browser for SQLite  

\- MySQL Workbench (compatible)



---# Task 3: Writing Basic SELECT Queries



\## 📝 Objective:

Extract data from one or more tables using basic SQL `SELECT` queries.



---



\## 🛠 Tools Used:

\- DB Browser for SQLite  

\- MySQL Workbench (compatible)



---



\## 📦 Deliverables:

\- SQL script using: `SELECT`, `WHERE`, `AND`, `OR`, `LIKE`, `BETWEEN`, `ORDER BY`, `LIMIT`, `COALESCE`



---



\## 💡 Hints / Mini Guide:

1\. Use `SELECT \*` and specific columns  

2\. Apply `WHERE`, `AND`, `OR`, `LIKE`, `BETWEEN`  

3\. Sort with `ORDER BY`  

4\. Use `LIMIT` to restrict results  

5\. Handle `NULL` using `COALESCE`



---



\## 🔧 SQL Script



```sql

-- Step 1: Drop and Create Employee Table

DROP TABLE IF EXISTS Employee;



CREATE TABLE Employee (

&nbsp;   emp\_id INTEGER PRIMARY KEY,

&nbsp;   emp\_name TEXT NOT NULL,

&nbsp;   salary REAL NOT NULL,

&nbsp;   bonus REAL DEFAULT NULL,

&nbsp;   department TEXT DEFAULT 'General'

);



-- Step 2: Insert sample records

INSERT INTO Employee (emp\_id, emp\_name, salary, bonus, department)

VALUES (1, 'John', 55000.50, 2.50, 'HR');



INSERT INTO Employee (emp\_id, emp\_name, salary)

VALUES (2, 'Priya', 60000.00);



INSERT INTO Employee (emp\_id, emp\_name, salary, bonus)

VALUES (3, 'Ali', 45000.00, NULL);



INSERT INTO Employee (emp\_id, emp\_name, salary, bonus, department)

VALUES (4, 'Kiran', 47000.75, 1.75, 'Finance');



-- Task 3: SELECT Queries



-- 1. View all employee records

SELECT \* FROM Employee;



-- 2. View emp\_id and emp\_name only

SELECT emp\_id, emp\_name FROM Employee;



-- 3. Employees with salary > 50000

SELECT emp\_id, emp\_name, salary 

FROM Employee

WHERE salary > 50000;



-- 4. Salary between 45000 and 60000 AND department is 'General'

SELECT emp\_id, emp\_name, salary, department 

FROM Employee

WHERE salary BETWEEN 45000 AND 60000 AND department = 'General';



-- 5. Employees from 'HR' or 'Finance' department

SELECT emp\_id, emp\_name, department 

FROM Employee

WHERE department = 'HR' OR department = 'Finance';



-- 6. Employee names starting with 'P'

SELECT emp\_id, emp\_name 

FROM Employee

WHERE emp\_name LIKE 'P%';



-- 7. Sort by salary descending

SELECT emp\_id, emp\_name, salary 

FROM Employee

ORDER BY salary DESC;



-- 8. Top 2 highest paid employees

SELECT emp\_id, emp\_name, salary 

FROM Employee

ORDER BY salary DESC

LIMIT 2;



-- 9. Replace NULL in bonus with 0.00 using COALESCE and sort

SELECT emp\_id, emp\_name, salary, COALESCE(bonus, 0.00) AS bonus\_value

FROM Employee

ORDER BY bonus\_value DESC;





\## 📦 Deliverables:

\- SQL script using: `SELECT`, `WHERE`, `AND`, `OR`, `LIKE`, `BETWEEN`, `ORDER BY`, `LIMIT`, `COALESCE`



---



\## 💡 Hints / Mini Guide:

1\. Use `SELECT \*` and specific columns  

2\. Apply `WHERE`, `AND`, `OR`, `LIKE`, `BETWEEN`  

3\. Sort with `ORDER BY`  

4\. Use `LIMIT` to restrict results  

5\. Handle `NULL` using `COALESCE`



---



\## 🔧 SQL Script



```sql

-- Step 1: Drop and Create Employee Table

DROP TABLE IF EXISTS Employee;



CREATE TABLE Employee (

&nbsp;   emp\_id INTEGER PRIMARY KEY,

&nbsp;   emp\_name TEXT NOT NULL,

&nbsp;   salary REAL NOT NULL,

&nbsp;   bonus REAL DEFAULT NULL,

&nbsp;   department TEXT DEFAULT 'General'

);



-- Step 2: Insert sample records

INSERT INTO Employee (emp\_id, emp\_name, salary, bonus, department)

VALUES (1, 'John', 55000.50, 2.50, 'HR');



INSERT INTO Employee (emp\_id, emp\_name, salary)

VALUES (2, 'Priya', 60000.00);



INSERT INTO Employee (emp\_id, emp\_name, salary, bonus)

VALUES (3, 'Ali', 45000.00, NULL);



INSERT INTO Employee (emp\_id, emp\_name, salary, bonus, department)

VALUES (4, 'Kiran', 47000.75, 1.75, 'Finance');



-- Task 3: SELECT Queries



-- 1. View all employee records

SELECT \* FROM Employee;



-- 2. View emp\_id and emp\_name only

SELECT emp\_id, emp\_name FROM Employee;



-- 3. Employees with salary > 50000

SELECT emp\_id, emp\_name, salary 

FROM Employee

WHERE salary > 50000;



-- 4. Salary between 45000 and 60000 AND department is 'General'

SELECT emp\_id, emp\_name, salary, department 

FROM Employee

WHERE salary BETWEEN 45000 AND 60000 AND department = 'General';



-- 5. Employees from 'HR' or 'Finance' department

SELECT emp\_id, emp\_name, department 

FROM Employee

WHERE department = 'HR' OR department = 'Finance';



-- 6. Employee names starting with 'P'

SELECT emp\_id, emp\_name 

FROM Employee

WHERE emp\_name LIKE 'P%';



-- 7. Sort by salary descending

SELECT emp\_id, emp\_name, salary 

FROM Employee

ORDER BY salary DESC;



-- 8. Top 2 highest paid employees

SELECT emp\_id, emp\_name, salary 

FROM Employee

ORDER BY salary DESC

LIMIT 2;



-- 9. Replace NULL in bonus with 0.00 using COALESCE and sort

SELECT emp\_id, emp\_name, salary, COALESCE(bonus, 0.00) AS bonus\_value

FROM Employee

ORDER BY bonus\_value DESC;



