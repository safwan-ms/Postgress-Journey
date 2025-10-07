-- -----------------
-- List databases
-- -----------------
\l

-- ---------------------------
-- Create databases
-- ---------------------------
CREATE DATABASE machines;
CREATE DATABASE computer;

-- -----------------------
-- Drop database
-- -----------------------
DROP DATABASE computer;

-- -----------------------
-- Connect to a database
-- -----------------------
\c machines

-- -----------------------
-- Create table games
-- -----------------------
CREATE TABLE games(
    name VARCHAR(50) DEFAULT 'Anonymous',
    release_year INT DEFAULT 2025,
    ratings INT
);

-- -----------------------
-- Insert into games
-- -----------------------
INSERT INTO games(name, release_year, ratings)
VALUES
('GTA 6', 2025, 6),
('GTA 5', 2013, 9),
('Batman: Arkham Knight', 2015, 7),
('AKR 2', 2017, 2);

-- -----------------------
-- Select queries
-- -----------------------
SELECT * FROM games;
SELECT name, ratings FROM games;
SELECT 2 + 2 AS add, 2 - 2 AS sub, 2 * 2 AS mul;

-- -----------------------
-- Create table movies
-- -----------------------
CREATE TABLE movies(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    genre VARCHAR(50),
    director VARCHAR(50),
    cast_count INT,
    languages INT,
    release_year INT,
    imdb_ratings DOUBLE PRECISION,
    duration INT
);

-- -----------------------
-- Insert into movies
-- -----------------------
INSERT INTO movies(title, genre, director, cast_count, languages, release_year, imdb_ratings, duration)
VALUES
('The Wither', 'Horror', 'Timur', 5, 5, 2025, 5.0, 120),
('Extraction', 'Action', 'Sam Hargrave', 5, 5, 2025, 5.0, 120);

-- -----------------------
-- Select queries
-- -----------------------
SELECT * FROM movies;
SELECT * FROM movies WHERE genre = 'Action';
SELECT title, genre FROM movies WHERE genre = 'Action';
SELECT title FROM movies WHERE imdb_ratings = 5.0;

-- -----------------------
-- Aliases
-- -----------------------
SELECT id AS movie_id FROM movies;
SELECT title AS movie_name FROM movies;
SELECT imdb_ratings AS movie_rating FROM movies;
SELECT cast_count AS casts FROM movies;

-- -----------------------
-- Create table users
-- -----------------------
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(50),
    password VARCHAR(50)
);

-- -----------------------
-- Insert into users
-- -----------------------
INSERT INTO users(name, age, email, password)
VALUES
('John', 25, 'U3Qc2@example.com', 'password123'),
('Jane', 30, 'qGqQh@example.com', 'password456'),
('Bob', 35, 'I3l0h@example.com', 'password789');

-- -----------------------
-- Select, update, delete users
-- -----------------------
SELECT * FROM users;

UPDATE users
SET age = 30
WHERE id = 1;

UPDATE users
SET password = 'newpassword'
WHERE id = 1;

DELETE FROM users
WHERE id = 1;

DELETE FROM users; -- delete all rows

SELECT * FROM users;
