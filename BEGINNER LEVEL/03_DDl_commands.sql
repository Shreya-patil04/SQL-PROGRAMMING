-- CREATE QUERY: -
-- SQL TASK: Create a new table called persons with columns: id, person_name, birth_date and phone
CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	-- declaring a primary key
	CONSTRAINT pk_persons PRIMARY KEY (id) 
	)
-- displaying the table
SELECT * FROM persons 


-- ALTER QUERY: -
-- SQL TASK: Add a new column called email to the persons table
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL
-- displaying the table
SELECT * FROM persons 

-- SQL TASK: Remove the column phone from the persons column
ALTER TABLE persons
DROP COLUMN phone
-- displaying the table
SELECT * FROM persons

-- DROP QUERY: -
-- SQL TASK: Delete the table persons from the database
DROP TABLE persons