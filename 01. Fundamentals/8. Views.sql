-- Create table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,  -- SERIAL automatically handles integer + autoincrement
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10, 2)   -- NUMERIC is preferred for exact decimal values
);

-- Insert data
INSERT INTO employees (first_name, last_name, department, salary)
VALUES
    ('John', 'Doe', 'IT', 50000.00),
    ('Jane', 'Smith', 'HR', 60000.00),
    ('Alice', 'Johnson', 'Finance', 70000.00);

-- Create a view
CREATE VIEW employee_names AS
SELECT 
    id, 
    first_name || ' ' || last_name AS full_name   -- PostgreSQL uses || for string concatenation
FROM employees;

-- Query the view
SELECT * FROM employee_names;

-- Create or replace view (update existing view)
CREATE OR REPLACE VIEW employee_names AS
SELECT 
    id, 
    first_name || ' ' || last_name AS full_name
FROM employees
WHERE department = 'IT';

-- Query updated view
SELECT * FROM employee_names;

-- Drop the view
DROP VIEW IF EXISTS employee_names;
