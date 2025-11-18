USE company_db;

-- SELECT ALL DATA
SELECT * FROM employees;

-- SELECT SPECIFIC COLUMNS
SELECT emp_name, department FROM employees;

-- FILTERING
SELECT * FROM employees
WHERE salary > 60000;

-- SORTING
SELECT * FROM employees
ORDER BY salary DESC;

-- AGGREGATION
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
