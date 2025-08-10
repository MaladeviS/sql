-- Task 4: Aggregate Functions and Grouping

-- Step 1: Drop and Create Employee Table (same as Task 3 for consistency)
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    emp_id INTEGER PRIMARY KEY,
    emp_name TEXT NOT NULL,
    salary REAL NOT NULL,
    bonus REAL DEFAULT NULL,
    department TEXT DEFAULT 'General'
);

-- Step 2: Insert sample records
INSERT INTO Employee (emp_id, emp_name, salary, bonus, department)
VALUES (1, 'John', 55000.50, 2.50, 'HR');

INSERT INTO Employee (emp_id, emp_name, salary)
VALUES (2, 'Priya', 60000.00);

INSERT INTO Employee (emp_id, emp_name, salary, bonus)
VALUES (3, 'Ali', 45000.00, NULL);

INSERT INTO Employee (emp_id, emp_name, salary, bonus, department)
VALUES (4, 'Kiran', 47000.75, 1.75, 'Finance');

INSERT INTO Employee (emp_id, emp_name, salary, bonus, department)
VALUES (5, 'Sara', 70000.00, 3.00, 'HR');

-- 1. Total salary by department
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;

-- 2. Count employees by department
SELECT department, COUNT(*) AS employee_count
FROM Employee
GROUP BY department;

-- 3. Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department;

-- 4. Maximum salary in each department
SELECT department, MAX(salary) AS max_salary
FROM Employee
GROUP BY department;

-- 5. Departments with average salary > 50000
SELECT department, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department
HAVING avg_salary > 50000;

-- 6. Total bonus by department (replace NULL with 0)
SELECT department, SUM(COALESCE(bonus, 0.00)) AS total_bonus
FROM Employee
GROUP BY department;

-- 7. Number of employees with bonus > 2 in each department
SELECT department, COUNT(*) AS count_bonus_gt_2
FROM Employee
WHERE bonus > 2
GROUP BY department;

-- 8. Department with highest total salary
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;
