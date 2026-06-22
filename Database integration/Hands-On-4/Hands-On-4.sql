USE college_db;

SELECT first_name, last_name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM enrollments
    WHERE grade='A'
);

SELECT prof_name, salary
FROM professors
WHERE salary = (
    SELECT MAX(salary)
    FROM professors
);

SELECT course_name, credits
FROM courses
WHERE credits > (
    SELECT AVG(credits)
    FROM courses
);

CREATE VIEW student_course_view AS
SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

SELECT * FROM student_course_view;

CREATE INDEX idx_student_email
ON students(email);

EXPLAIN
SELECT * FROM students
WHERE email='arjun.mehta@college.edu';

SELECT dept_name, budget
FROM departments
WHERE budget = (
    SELECT MAX(budget)
    FROM departments
);

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.student_id) > 1;
