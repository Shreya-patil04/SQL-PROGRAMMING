-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS company_db;

-- USE DATABASE
USE company_db;

-- CREATE TABLES
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
