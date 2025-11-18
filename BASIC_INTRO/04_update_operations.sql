USE company_db;

-- UPDATE RECORD
UPDATE employees
SET salary = 72000
WHERE emp_name = 'Amit Sharma';

-- UPDATE MULTIPLE FIELDS
UPDATE employees
SET department = 'Marketing', salary = 58000
WHERE emp_id = 3;
