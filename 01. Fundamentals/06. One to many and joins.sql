-- --------------------------------------------------------------
-- Drop tables if they already exist (optional, for re-running)
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS engineer;

-- --------------------------------------------------------------
-- Create Engineer Table
CREATE TABLE engineer (
    engineer_id SERIAL PRIMARY KEY,
    engineer_name VARCHAR(255) NOT NULL,
    profession VARCHAR(255) NOT NULL,
    email VARCHAR(50)
);

-- --------------------------------------------------------------
-- Create Tasks Table
CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    task_name VARCHAR(255),
    task_description TEXT,
    engineer_id INT,
    CONSTRAINT fk_engineer
        FOREIGN KEY (engineer_id)
        REFERENCES engineer(engineer_id)
        ON DELETE CASCADE
);

-- --------------------------------------------------------------
-- Insert Data into Engineer
INSERT INTO engineer (engineer_name, profession, email)
VALUES
    ('Alice Johnson', 'Full-Stack', 'aj@gmail.com'),
    ('Bob Smith', 'Back-End', 'bobsmith@gmail.com'),
    ('Charlie Brown', 'Front-End', 'charilebrown@gmail.com');

-- --------------------------------------------------------------
-- Insert Data into Tasks
INSERT INTO tasks (task_name, task_description, engineer_id)
VALUES
    ('Task 1', 'Design the UI in Figma', 1),
    ('Task 2', 'Build the Server in Bun', 2),
    ('Task 3', 'Code the UI in TailwindCSS', 1);

-- --------------------------------------------------------------
-- Check data
SELECT * FROM tasks;

-- --------------------------------------------------------------
-- CROSS JOIN
-- Returns all combinations of engineer and task rows
SELECT * FROM engineer CROSS JOIN tasks;

-- Alternate syntax (PostgreSQL supports this too)
SELECT * FROM engineer, tasks;

-- --------------------------------------------------------------
-- INNER JOIN
-- Returns only matching engineer-task pairs
SELECT * FROM engineer  
INNER JOIN tasks ON engineer.engineer_id = tasks.engineer_id;

SELECT * FROM engineer e 
INNER JOIN tasks t ON e.engineer_id = t.engineer_id;

SELECT engineer_name, email, task_name, task_description 
FROM engineer e 
INNER JOIN tasks t ON e.engineer_id = t.engineer_id;

SELECT * FROM tasks t
JOIN engineer e ON e.engineer_id = t.engineer_id;

-- --------------------------------------------------------------
-- LEFT JOIN
-- Returns all engineers, even if they have no assigned tasks
SELECT * FROM engineer e 
LEFT JOIN tasks t ON e.engineer_id = t.engineer_id;

-- --------------------------------------------------------------
-- RIGHT JOIN
-- Returns all tasks, even if they have no assigned engineers
SELECT * FROM engineer e 
RIGHT JOIN tasks t ON e.engineer_id = t.engineer_id;
