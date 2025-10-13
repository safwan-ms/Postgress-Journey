-- ------------------------------------
-- Create 'games' table
-- ------------------------------------
CREATE TABLE games (
    name VARCHAR(10),
    genre CHAR(10)
);

INSERT INTO games (name, genre)
VALUES ('game1', 'Action');

SELECT * FROM games;


-- ------------------------------------
-- Create 'events' table
-- ------------------------------------
CREATE TABLE events (
    event_name VARCHAR(255),
    event_date DATE,
    event_time TIME,
    event_datetime TIMESTAMP
);

-- PostgreSQL equivalent of DESC is:
-- \d events  (run this in psql)
-- or use: SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'events';

INSERT INTO events (event_name, event_date, event_time, event_datetime)
VALUES 
('Meeting', '2024-03-02', '14:30:00', '2024-03-02 14:30:00'),
('Presentation', '2024-03-03', '09:00:00', '2024-03-03 09:00:00'),
('Party', '2024-03-04', '20:00:00', '2024-03-04 20:00:00');

SELECT * FROM events;


-- ------------------------------------
-- Current Date/Time functions
-- ------------------------------------
SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT NOW();  -- Same as in MySQL


-- ------------------------------------
-- Create 'comments' table
-- ------------------------------------
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    author VARCHAR(255),
    content VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger for auto-updating updated_at on UPDATE
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_comments_timestamp
BEFORE UPDATE ON comments
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Insert sample data
INSERT INTO comments (author, content)
VALUES 
('Safwax', 'This is a great article!'),
('Jordan', 'I have a question about this topic.'),
('Charlie', 'Thanks for sharing this information.');

SELECT * FROM comments;

-- Updating a comment
UPDATE comments
SET content = 'What is going on here?'
WHERE id = 1;
