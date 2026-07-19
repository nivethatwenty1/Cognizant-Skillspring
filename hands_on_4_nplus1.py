import mysql.connector
import time

# Database Connection
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="college_db"
)

cursor = conn.cursor()

# -----------------------------
# Step 56 - N+1 Query Problem
# -----------------------------

start = time.time()

query_count = 1

cursor.execute("SELECT * FROM enrollments")
enrollments = cursor.fetchall()

for row in enrollments:
    student_id = row[1]

    cursor.execute(
        "SELECT first_name, last_name FROM students WHERE student_id = %s",
        (student_id,)
    )

    student = cursor.fetchone()

query_count += len(enrollments)

end = time.time()

print("Step 56")
print("Queries Executed:", query_count)
print("Execution Time:", end - start)

cursor.close()
conn.close()

# -----------------------------
# Step 57 - JOIN Solution
# -----------------------------

conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="college_db"
)

cursor = conn.cursor()

start = time.time()

cursor.execute("""
SELECT
    e.enrollment_id,
    s.first_name,
    s.last_name,
    e.course_id,
    e.grade
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
""")

records = cursor.fetchall()

end = time.time()

print("\nStep 57")
print("Queries Executed: 1")
print("Execution Time:", end - start)

cursor.close()
conn.close()

# -----------------------------
# Step 58 - Comparison
# -----------------------------

print("\nComparison")
print("N+1 Approach : Multiple Queries")
print("JOIN Approach : 1 Query")
print("JOIN is faster because it reduces database round-trips.")

# --------------------------------------------------
# Step 59
#
# If there are 10,000 enrollments:
#
# N+1 Approach
# -------------
# 1 query to fetch enrollments
# +10,000 queries to fetch students
# = 10,001 queries
#
# JOIN Approach
# -------------
# Only 1 query
#
# JOIN is much faster and recommended.
# --------------------------------------------------