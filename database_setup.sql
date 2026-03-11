-- MySQL Database Setup Script for Student Management System
-- Username: root
-- Password: sathwik

-- Drop existing database if it exists
DROP DATABASE IF EXISTS student_management_db;

-- Create new database
CREATE DATABASE student_management_db;

-- Use the created database
USE student_management_db;

-- Create Student table
CREATE TABLE student (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    course VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better query performance
CREATE INDEX idx_email ON student(email);
CREATE INDEX idx_course ON student(course);

-- Insert sample data (optional)
INSERT INTO student (name, email, course) VALUES 
('John Doe', 'john@example.com', 'Java'),
('Jane Smith', 'jane@example.com', 'Python'),
('Bob Johnson', 'bob@example.com', 'Java'),
('Alice Williams', 'alice@example.com', 'Web Development');

-- Display the created table structure
DESC student;

-- Display sample data
SELECT * FROM student;
