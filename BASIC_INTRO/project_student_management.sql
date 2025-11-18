-- STUDENT MANAGEMENT SYSTEM

CREATE DATABASE IF NOT EXISTS student_mgmt;
USE student_mgmt;

-- TABLES
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- SAMPLE DATA
INSERT INTO students (name, email, department) VALUES
('Riya Mehta', 'riya@example.com', 'Computer'),
('Arjun Rao', 'arjun@example.com', 'Mechanical');

INSERT INTO marks (student_id, subject, marks) VALUES
(1, 'Math', 85),
(1, 'Physics', 78),
(2, 'Math', 66);

-- JOIN QUERY
SELECT s.name, s.department, m.subject, m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id;
