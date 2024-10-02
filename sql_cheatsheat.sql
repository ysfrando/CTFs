CREATE DATABASE my_database; -- Creating a Database
USE my_database; -- Using the database

-- Creating a table
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(100)
  );

INSERT INTO users (username, password, email) VALUES ('john_doe', 'securepassword', 'john@example.com'); -- Inserting data
SELECT * FROM users; -- Select all columns
SELECT username, email FROM users; -- Select specific columns from the table







