-- Create tables
CREATE TABLE Department (
  department_id INT PRIMARY KEY,
  department_name TEXT NOT NULL UNIQUE
);

CREATE TABLE Employee (
  employee_id INT PRIMARY KEY,
  name TEXT,
  email TEXT,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Project (
  project_id INT PRIMARY KEY,
  project_name TEXT,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Manager (
  manager_id INT PRIMARY KEY,
  name TEXT,
  project_id INT,
  FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

CREATE TABLE WorkDetails (
  work_id INT PRIMARY KEY,
  employee_id INT,
  project_id INT,
  hours_worked INT,
  rating TEXT,
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
  FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

-- Insert sample data
INSERT INTO Department VALUES 
(1, 'IT'),
(2, 'Finance');

INSERT INTO Employee VALUES
(101, 'John', 'john@company.com', 1),
(102, 'Divya', 'divya@company.com', 2);

INSERT INTO Project VALUES
(301, 'Cloud Migration', 1),
(302, 'Budget Planning', 2);

INSERT INTO Manager VALUES
(201, 'Ms. Neha', 301),
(202, 'Mr. Arjun', 302);

INSERT INTO WorkDetails VALUES
(1, 101, 301, 42, 'Excellent'),
(2, 102, 302, 37, 'Very Good');

-- Final JOIN Query to view employee full details
SELECT 
  e.name AS employee,
  d.department_name,
  p.project_name,
  w.hours_worked,
  w.rating,
  m.name AS manager
FROM WorkDetails w
JOIN Employee e ON e.employee_id = w.employee_id
JOIN Project p ON p.project_id = w.project_id
JOIN Manager m ON m.project_id = p.project_id
JOIN Department d ON d.department_id = e.department_id;
