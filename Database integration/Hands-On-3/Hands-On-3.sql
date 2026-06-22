USE college_db;

SELECT s.first_name, s.last_name, c.course_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;

SELECT s.first_name, e.course_id
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id;

SELECT d.dept_name, COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.dept_name;

SELECT d.dept_name, AVG(p.salary) AS avg_salary
FROM departments d
INNER JOIN professors p ON d.department_id = p.department_id
GROUP BY d.dept_name;

SELECT d.dept_name, COUNT(s.student_id) AS total_students
FROM departments d
INNER JOIN students s ON d.department_id = s.department_id
GROUP BY d.dept_name
HAVING COUNT(s.student_id) > 2;

SELECT s.first_name, c.course_name, e.grade
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';

SELECT s.first_name, c.course_name, d.dept_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id
INNER JOIN departments d ON s.department_id = d.department_id;

SELECT * FROM professors
ORDER BY salary DESC
LIMIT 1;

SELECT d.dept_name, COUNT(c.course_id) AS total_courses
FROM departments d
LEFT JOIN courses c ON d.department_id = c.department_id
GROUP BY d.dept_name;
