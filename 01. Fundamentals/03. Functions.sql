-- ================================================
-- 1. USERS TABLE
-- ================================================
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    age INT
);

INSERT INTO users (first_name, last_name, email, password, age)
VALUES
('Jane', 'Doe', 'jane@example.com', 'password4', 10),
('Michael', 'Brown', 'michael@example.com', 'password5', 20),
('Emma', 'Johnson', 'emma1@example.com', 'password6', 35),
('William', 'Davis', 'william@example.com', 'password7', 30),
('Olivia', 'Martinez', 'olivia@example.com', 'password8', 35),
('James', 'Miller', 'james@example.com', 'password9', 35),
('Sophia', 'Garcia', 'sophia@example.com', 'password10', 40),
('Benjamin', 'Rodriguez', 'benjamin@example.com', 'password11', 42),
('Amelia', 'Lopez', 'amelia@example.com', 'password12', 45),
('Elijah', 'Lee', 'elijah@example.com', 'password13', 50),
('Charlotte', 'Harris', 'charlotte@example.com', 'password14', 60),
('David', 'Clark', 'david@example.com', 'password15', 70),
('Mia', 'Lewis', 'mia@example.com', 'password16', 80),
('Alexander', 'Allen', 'alexander@example.com', 'password17', 15),
('Isabella', 'Young', 'isabella@example.com', 'password18', 18),
('Ethan', 'Wright', 'ethan@example.com', 'password19', 22),
('Ava', 'King', 'ava@example.com', 'password20', 24),
('Noah', 'Scott', 'noah@example.com', 'password21', 21),
('Liam', 'Green', 'liam@example.com', 'password22', 34),
('Emma', 'Baker', 'emma2@example.com', 'password23', 31);

-- ================================================
-- 2. SUBSTRING FUNCTION (PostgreSQL uses single quotes)
-- ================================================
SELECT SUBSTRING('Hello World' FROM 7 FOR 5);
SELECT SUBSTRING('HuXn' FROM 3);
SELECT SUBSTRING(first_name FROM 2) FROM users;
SELECT SUBSTRING(first_name FROM 2 FOR 6) FROM users;
SELECT SUBSTRING(first_name FROM 1 FOR 7) FROM users;

-- ================================================
-- 3. REPLACE FUNCTION
-- ================================================
SELECT REPLACE('HELLO WORLD', 'HELLO', 'BYE');
SELECT REPLACE('HuXn', 'X', 'Z');
SELECT REPLACE(first_name, 'Jane', 'Janeeeee') FROM users;
SELECT REPLACE(last_name, 'Doe', 'Doeeee') FROM users;

-- ================================================
-- 4. REVERSE FUNCTION (PostgreSQL has no built-in REVERSE, use custom)
-- ================================================
-- Create a helper function for REVERSE in PostgreSQL
CREATE OR REPLACE FUNCTION reverse(text)
RETURNS text AS $$
SELECT string_agg(c, '')
FROM regexp_split_to_table($1, '') WITH ORDINALITY t(c, n)
ORDER BY n DESC;
$$ LANGUAGE sql IMMUTABLE;

SELECT reverse('Hello World');
SELECT reverse('HuXn');
SELECT reverse(first_name) FROM users;
SELECT reverse(last_name) FROM users;
SELECT reverse(password) FROM users;

-- ================================================
-- 5. CHAR_LENGTH
-- ================================================
SELECT CHAR_LENGTH('Hello World');
SELECT CHAR_LENGTH('HuXn');
SELECT CHAR_LENGTH(first_name) FROM users;
SELECT CHAR_LENGTH(last_name) FROM users;

-- ================================================
-- 6. LENGTH
-- (In PostgreSQL, LENGTH() and CHAR_LENGTH() behave the same for VARCHAR)
-- ================================================
SELECT LENGTH('Hello World');
SELECT LENGTH('HuXn');
SELECT LENGTH(first_name) FROM users;
SELECT LENGTH(last_name) FROM users;

-- ================================================
-- 7. ORDER BY Examples
-- ================================================
SELECT first_name FROM users ORDER BY first_name ASC;
SELECT first_name FROM users ORDER BY first_name DESC;
SELECT first_name FROM users ORDER BY LENGTH(first_name);
SELECT first_name FROM users ORDER BY LENGTH(first_name) DESC;

-- ================================================
-- 8. LIMIT
-- ================================================
SELECT first_name FROM users;
SELECT first_name FROM users LIMIT 5;
SELECT first_name FROM users LIMIT 2;

-- ================================================
-- 9. LIKE (Wildcards)
-- % → zero or more chars
-- _ → exactly one char
-- ================================================
SELECT * FROM users
WHERE first_name LIKE '%j%';

-- SELECT * FROM users WHERE first_name LIKE '%%';
-- SELECT * FROM users WHERE first_name LIKE '%mma%';
-- SELECT * FROM users WHERE first_name LIKE '_mma';
-- SELECT * FROM users WHERE first_name LIKE '__exander';

-- ================================================
-- 10. COUNT
-- ================================================
SELECT COUNT(*) FROM users;
SELECT COUNT(first_name) FROM users;

SELECT COUNT(*) FROM users
WHERE first_name = 'Emma';

SELECT COUNT(*) FROM users
WHERE first_name = 'Michael';

-- ================================================
-- 11. AGGREGATE FUNCTIONS
-- ================================================
SELECT MIN(age) FROM users;
SELECT MAX(age) FROM users;
SELECT AVG(age) FROM users;
SELECT SUM(age) FROM users;

-- ================================================
-- 12. GROUP BY Example
-- ================================================
SELECT first_name, AVG(age) AS average_age
FROM users
GROUP BY first_name;
