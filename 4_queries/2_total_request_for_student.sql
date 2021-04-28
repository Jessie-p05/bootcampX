SELECT count(*) as total_assistance, students.name
FROM students
JOIN assistance_requests ON students.id = student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;