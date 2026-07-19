-- ==========================================================
-- Digital Nurture 5.0
-- Python Full Stack Engineer Track
-- Module 3: Database Integration
-- Hands-On 4: Query Optimisation – Indexes, EXPLAIN & the N+1 Problem
-- Name: Nivetha E
-- ==========================================================

-- ==========================================================
-- Task 1: Baseline Performance – No Indexes
-- ==========================================================

-- Step 48: EXPLAIN Query

EXPLAIN FORMAT=JSON
SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM enrollments e
INNER JOIN students s
ON s.student_id = e.student_id
INNER JOIN courses c
ON c.course_id = e.course_id
WHERE s.enrollment_year = 2022;

-- Step 49:
-- EXPLAIN shows a Full Table Scan (access_type = ALL)
-- on the students table.

-- Step 50:
-- Estimated Query Cost = 2.12

-- ==========================================================
-- Task 2: Add Indexes and Compare Plans
-- ==========================================================

-- Step 51: Create B-Tree Index

CREATE INDEX idx_students_enrollment_year
ON students(enrollment_year);

-- Step 52: Create Composite UNIQUE Index

CREATE UNIQUE INDEX idx_enrollments_student_course
ON enrollments(student_id, course_id);

-- Step 53: Create Index on course_code

CREATE INDEX idx_courses_course_code
ON courses(course_code);

-- Step 54: Re-run EXPLAIN after creating indexes

EXPLAIN FORMAT=JSON
SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM enrollments e
INNER JOIN students s
ON s.student_id = e.student_id
INNER JOIN courses c
ON c.course_id = e.course_id
WHERE s.enrollment_year = 2022;

-- Compare the new execution plan with the baseline.
-- Check whether the access type changes from ALL to ref/range/index.

-- Step 55: Partial Index

-- MySQL does not support partial indexes.
-- Creating a normal index on student_id instead.

CREATE INDEX idx_enrollments_student_id
ON enrollments(student_id);