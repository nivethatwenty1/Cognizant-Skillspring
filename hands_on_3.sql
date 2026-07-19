-- ==========================================================
-- Digital Nurture 5.0
-- Python Full Stack Engineer Track
-- Module 3: Database Integration
-- Hands-On 3: Advanced SQL – Subqueries, Views & Transactions
-- Name: Nivetha E
-- ==========================================================

-- ==========================================================
-- Task 1: Subqueries
-- ==========================================================

-- ==========================================================
-- Question 35
-- Students Enrolled in More Courses Than the Average
-- ==========================================================

SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    COUNT(e.course_id) AS total_courses
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) >
(
    SELECT AVG(course_count)
    FROM
    (
        SELECT COUNT(*) AS course_count
        FROM enrollments
        GROUP BY student_id
    ) AS avg_table
);

-- ==========================================================
-- Question 36
-- Courses Where All Students Received Grade A
-- ==========================================================

SELECT
    c.course_name,
    c.course_code
FROM courses c
WHERE NOT EXISTS
(
    SELECT *
    FROM enrollments e
    WHERE e.course_id = c.course_id
    AND e.grade <> 'A'
);

-- ==========================================================
-- Question 37
-- Highest Paid Professor in Each Department
-- ==========================================================

SELECT
    p.prof_name,
    d.dept_name,
    p.salary
FROM professors p
INNER JOIN departments d
ON p.department_id = d.department_id
WHERE p.salary =
(
    SELECT MAX(p2.salary)
    FROM professors p2
    WHERE p2.department_id = p.department_id
);

-- ==========================================================
-- Question 38
-- Departments with Average Salary Greater Than 85000
-- ==========================================================

SELECT *
FROM
(
    SELECT
        d.dept_name,
        ROUND(AVG(p.salary),2) AS average_salary
    FROM departments d
    INNER JOIN professors p
    ON d.department_id = p.department_id
    GROUP BY d.department_id, d.dept_name
) AS dept_salary
WHERE average_salary > 85000;

-- ==========================================================
-- Task 2: Creating and Using Views
-- ==========================================================

-- ==========================================================
-- Question 39
-- View: Student Enrollment Summary
-- ==========================================================

CREATE VIEW vw_student_enrollment_summary AS
SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    d.dept_name,
    COUNT(e.course_id) AS total_courses,
    ROUND(
        AVG(
            CASE
                WHEN e.grade = 'A' THEN 4
                WHEN e.grade = 'B' THEN 3
                WHEN e.grade = 'C' THEN 2
                WHEN e.grade = 'D' THEN 1
                WHEN e.grade = 'F' THEN 0
            END
        ),2
    ) AS gpa
FROM students s
LEFT JOIN departments d
ON s.department_id = d.department_id
LEFT JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.student_id, student_name, d.dept_name;

-- ==========================================================
-- Question 40
-- View: Course Statistics
-- ==========================================================

CREATE VIEW vw_course_stats AS
SELECT
    c.course_name,
    c.course_code,
    COUNT(e.enrollment_id) AS total_enrollments,
    ROUND(
        AVG(
            CASE
                WHEN e.grade='A' THEN 4
                WHEN e.grade='B' THEN 3
                WHEN e.grade='C' THEN 2
                WHEN e.grade='D' THEN 1
                WHEN e.grade='F' THEN 0
            END
        ),2
    ) AS avg_gpa
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name, c.course_code;

-- ==========================================================
-- Question 41
-- Students with GPA Above 3.0
-- ==========================================================

SELECT *
FROM vw_student_enrollment_summary
WHERE gpa > 3.0;

-- ==========================================================
-- Question 42
-- Attempt Update Through View
-- ==========================================================

-- This statement may fail because the view is created
-- using multiple tables and aggregate functions.

UPDATE vw_student_enrollment_summary
SET student_name = 'Sample Student'
WHERE student_id = 1;

-- Observation:
-- Multi-table views containing JOIN, GROUP BY or aggregate
-- functions are generally not updatable in MySQL.

-- ==========================================================
-- Question 43
-- Drop and Recreate View with CHECK OPTION
-- ==========================================================

DROP VIEW IF EXISTS vw_student_enrollment_summary;
DROP VIEW IF EXISTS vw_course_stats;

CREATE VIEW vw_student_enrollment_summary AS
SELECT
    student_id,
    first_name,
    last_name,
    email,
    department_id
FROM students
WHERE department_id = 1
WITH CHECK OPTION;

-- ==========================================================
-- Task 3: Stored Procedures and Transactions
-- ==========================================================

-- ==========================================================
-- Question 44
-- Stored Procedure: Enroll Student
-- ==========================================================

DELIMITER $$

CREATE PROCEDURE sp_enroll_student(
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_enrollment_date DATE
)
BEGIN
    IF EXISTS (
        SELECT *
        FROM enrollments
        WHERE student_id = p_student_id
        AND course_id = p_course_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student is already enrolled in this course.';
    ELSE
        INSERT INTO enrollments
        (student_id, course_id, enrollment_date, grade)
        VALUES
        (p_student_id, p_course_id, p_enrollment_date, NULL);
    END IF;
END$$

DELIMITER ;

-- Test Procedure
CALL sp_enroll_student(10, 2, '2024-01-15');

-- ==========================================================
-- Question 45
-- Department Transfer with Transaction
-- ==========================================================

CREATE TABLE IF NOT EXISTS department_transfer_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    old_department INT,
    new_department INT,
    transfer_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE PROCEDURE sp_transfer_student(
    IN p_student_id INT,
    IN p_new_department INT
)
BEGIN
    DECLARE old_dept INT;

    START TRANSACTION;

    SELECT department_id
    INTO old_dept
    FROM students
    WHERE student_id = p_student_id;

    UPDATE students
    SET department_id = p_new_department
    WHERE student_id = p_student_id;

    INSERT INTO department_transfer_log
    (student_id, old_department, new_department)
    VALUES
    (p_student_id, old_dept, p_new_department);

    COMMIT;
END$$

DELIMITER ;

-- Test Procedure
CALL sp_transfer_student(2,3);

-- ==========================================================
-- Question 46
-- Transaction Rollback Example
-- ==========================================================

START TRANSACTION;

UPDATE students
SET department_id = 2
WHERE student_id = 3;

-- Invalid Department ID (Foreign Key Error)
UPDATE students
SET department_id = 999
WHERE student_id = 3;

ROLLBACK;

-- ==========================================================
-- Question 47
-- SAVEPOINT Example
-- ==========================================================

START TRANSACTION;

INSERT INTO enrollments
(student_id, course_id, enrollment_date, grade)
VALUES
(9,2,CURDATE(),NULL);

SAVEPOINT first_insert;

-- This should fail because course_id 999 does not exist
INSERT INTO enrollments
(student_id, course_id, enrollment_date, grade)
VALUES
(9,999,CURDATE(),NULL);

ROLLBACK TO first_insert;

COMMIT;