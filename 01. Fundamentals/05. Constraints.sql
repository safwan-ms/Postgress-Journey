-- ------------------------------------
-- Create series table
CREATE TABLE series (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) UNIQUE,
    release_year INT,
    genre VARCHAR(255)
);

INSERT INTO series (title, release_year, genre) 
VALUES 
    ('Stranger Things', 2016, 'Science Fiction'),
    ('Game of Thrones', 2011, 'Fantasy');
-- Duplicate title will fail due to UNIQUE constraint
-- ('Breaking Bad', 2008, 'Drama'),
-- ('The Crown', 2016, 'Historical Drama');
-- ------------------------------------

-- ------------------------------------
-- Create employee table with CHECK constraints
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_age INT CHECK (emp_age >= 18 AND emp_age <= 65),
    emp_salary NUMERIC(10, 2) CHECK (emp_salary >= 0)
);

-- This should succeed
INSERT INTO employee (emp_id, emp_name, emp_age, emp_salary) 
VALUES (1, 'Alice', 25, 50000.00);

-- These should fail due to constraints
INSERT INTO employee (emp_id, emp_name, emp_age, emp_salary) 
VALUES (2, 'Bob', 16, 60000.00);

INSERT INTO employee (emp_id, emp_name, emp_age, emp_salary) 
VALUES (3, 'Charlie', 30, -1000.00);
-- ------------------------------------

-- ------------------------------------
-- Drop and recreate employee table with named constraints
DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_age INT,
    emp_salary NUMERIC(10, 2),
    CONSTRAINT chk_emp_age CHECK (emp_age >= 18 AND emp_age <= 65),
    CONSTRAINT chk_emp_salary CHECK (emp_salary >= 0)
);

-- Inserts same as above
INSERT INTO employee (emp_id, emp_name, emp_age, emp_salary) 
VALUES (1, 'Alice', 25, 50000.00);
-- Fails
INSERT INTO employee (emp_id, emp_name, emp_age, emp_salary) 
VALUES (2, 'Bob', 16, 60000.00);
-- Fails
INSERT INTO employee (emp_id, emp_name, emp_age, emp_salary) 
VALUES (3, 'Charlie', 30, -1000.00);
-- ------------------------------------

-- ------------------------------------
-- View all employees
SELECT * FROM employee;

-- Drop column
ALTER TABLE employee
DROP COLUMN emp_salary;

-- View updated table
SELECT * FROM employee;
-- ------------------------------------

-- ------------------------------------
-- Check table structure in psql
\d employee

-- Modify column type (VARCHAR length)
ALTER TABLE employee
ALTER COLUMN emp_name TYPE VARCHAR(255);

\d employee
-- ------------------------------------

-- ------------------------------------
-- Rename column
ALTER TABLE employee
RENAME COLUMN emp_name TO full_name;

\d employee;
-- ------------------------------------
