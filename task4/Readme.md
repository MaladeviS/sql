This task involves creating a database to manage employee details, including departments and associated information. The project uses SQL to create tables, define relationships, and insert example data.



📂 Database Structure

The database includes the following tables:



Department



Stores information about different departments.



Employee



Stores employee details and links each employee to a department.



🗂 ER Diagram

The ER diagram visually represents the relationship between Department and Employee.



One department can have multiple employees.



Each employee belongs to only one department.



🛠 SQL Script

sql

Copy

Edit

-- Create Department table

CREATE TABLE Department (

&nbsp;   department\_id INT PRIMARY KEY,

&nbsp;   department\_name TEXT NOT NULL UNIQUE

);



-- Create Employee table

CREATE TABLE Employee (

&nbsp;   emp\_id INT PRIMARY KEY,

&nbsp;   emp\_name TEXT NOT NULL,

&nbsp;   position TEXT,

&nbsp;   salary DECIMAL(10, 2),

&nbsp;   department\_id INT,

&nbsp;   FOREIGN KEY (department\_id) REFERENCES Department(department\_id)

);

📊 Example Data

sql

Copy

Edit

INSERT INTO Department (department\_id, department\_name) VALUES

(1, 'HR'),

(2, 'Finance'),

(3, 'IT');



INSERT INTO Employee (emp\_id, emp\_name, position, salary, department\_id) VALUES

(101, 'John Doe', 'Manager', 75000, 1),

(102, 'Jane Smith', 'Accountant', 55000, 2),

(103, 'Mike Johnson', 'Developer', 65000, 3);

📌 Features

Department management – Add, update, delete department records.



Employee management – Add, update, delete employee details.



Relational mapping – Each employee linked to a department.



🚀 How to Run

Open any SQL database tool (MySQL, SQLite, PostgreSQL).



Run the provided SQL script to create tables.



Insert example data using the given INSERT queries.



Run SELECT queries to fetch and view the data

