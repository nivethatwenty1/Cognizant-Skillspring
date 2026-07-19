-- ==========================================================
-- Digital Nurture 5.0
-- Python Full Stack Engineer Track
-- Module 3: Database Integration
-- Hands-On 2: Writing SQL Queries – DML, Joins & Aggregations
-- Name: Nivetha E
-- ==========================================================

-- ==========================================================
-- Task 1: Insert, Update and Delete Data
-- ==========================================================

-- Insert Two Additional Students

-- INSERT INTO students
-- (first_name, last_name, email, date_of_birth, department_id, enrollment_year)
-- VALUES
-- ('Rahul', 'Kumar', 'rahul.kumar@college.edu', '2003-06-18', 1, 2022),
-- ('Anjali', 'Sharma', 'anjali.sharma@college.edu', '2004-02-11', 2, 2023);

-- Update Student Grade

UPDATE enrollments
SET grade = 'B'
WHERE student_id = 5
AND course_id = 1;

-- Delete Enrollments with NULL Grades

DELETE FROM enrollments
WHERE grade IS NULL
AND enrollment_id > 0;

-- Verify Student Count

SELECT COUNT(*) AS total_students
FROM students;

-- Verify Enrollment Count

SELECT COUNT(*) AS total_enrollments
FROM enrollments;

-- ==========================================================
-- Task 2: Single-Table Queries and Filtering
-- ==========================================================

-- Students Enrolled in 2022

SELECT *
FROM students
WHERE enrollment_year = 2022
ORDER BY last_name ASC;

-- Courses with More Than 3 Credits

SELECT *
FROM courses
WHERE credits > 3
ORDER BY credits DESC;

-- Professors with Salary Between 80000 and 95000

SELECT *
FROM professors
WHERE salary BETWEEN 80000 AND 95000;

-- Students with College Email

SELECT *
FROM students
WHERE email LIKE '%@college.edu';

-- Student Count by Enrollment Year

SELECT enrollment_year,
COUNT(*) AS total_students
FROM students
GROUP BY enrollment_year;

-- ==========================================================
-- Task 3: Multi-Table Joins
-- ==========================================================

-- Student Name with Department

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    d.dept_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id;

-- Student Enrollment Details

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    e.enrollment_date,
    e.grade
FROM enrollments e
INNER JOIN students s
ON e.student_id = s.student_id
INNER JOIN courses c
ON e.course_id = c.course_id;

-- Students Not Enrolled in Any Course

SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- Course Enrollment Count

SELECT
    c.course_name,
    COUNT(e.student_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- Department Professors and Salaries

SELECT
    d.dept_name,
    p.prof_name,
    p.salary
FROM departments d
LEFT JOIN professors p
ON d.department_id = p.department_id;

-- ==========================================================
-- Task 4: Aggregations and Grouping
-- ==========================================================

-- Total Enrollments Per Course

SELECT
    c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- Average Professor Salary by Department

SELECT
    d.dept_name,
    ROUND(AVG(p.salary), 2) AS average_salary
FROM departments d
LEFT JOIN professors p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.dept_name;

-- Departments with Budget Greater Than 600000

SELECT
    dept_name,
    budget
FROM departments
WHERE budget > 600000;

-- Grade Distribution for CS101

SELECT
    e.grade,
    COUNT(*) AS total_students
FROM enrollments e
INNER JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_code = 'CS101'
GROUP BY e.grade;

-- Departments with More Than Two Students

SELECT
    d.dept_name,
    COUNT(s.student_id) AS total_students
FROM departments d
INNER JOIN students s
ON d.department_id = s.department_id
GROUP BY d.department_id, d.dept_name
HAVING COUNT(s.student_id) > 2;

