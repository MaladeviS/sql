-- Step 1: Drop and Create Employee Table
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    emp_id INTEGER PRIMARY KEY,              -- Unique employee ID
    emp_name TEXT NOT NULL,                  -- Name must be provided
    salary REAL NOT NULL,                    -- Salary: float/decimal value
    bonus REAL DEFAULT NULL,                 -- Optional bonus
    department TEXT DEFAULT 'General'        -- Default department if not given
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

-- Step 3: Task 3 - Writing Basic SELECT Queries

-- 1. Select all columns
SELECT * FROM Employee;

-- 2. Select only emp_id and emp_name
SELECT emp_id, emp_name FROM Employee;

-- 3. WHERE: Employees with salary > 50000
SELECT emp_id, emp_name, salary 
FROM Employee
WHERE salary > 50000;

-- 4. WHERE with AND: Salary between 45000 and 60000 AND department = 'General'
SELECT emp_id, emp_name, salary, department 
FROM Employee
WHERE salary BETWEEN 45000 AND 60000 AND department = 'General';

-- 5. WHERE with OR: Department is HR or Finance
SELECT emp_id, emp_name, department 
FROM Employee
WHERE department = 'HR' OR department = 'Finance';

-- 6. LIKE: Employee names starting with 'P'
SELECT emp_id, emp_name 
FROM Employee
WHERE emp_name LIKE 'P%';

-- 7. ORDER BY: Sort employees by salary descending
SELECT emp_id, emp_name, salary 
FROM Employee
ORDER BY salary DESC;

-- 8. LIMIT: Show top 2 highest salaries
SELECT emp_id, emp_name, salary 
FROM Employee
ORDER BY salary DESC
LIMIT 2;

-- 9. COALESCE: Show bonus, default to 0 if NULL
SELECT emp_id, emp_name, salary, COALESCE(bonus, 0.00) AS bonus_value
FROM Employee
ORDER BY bonus_value DESC;
