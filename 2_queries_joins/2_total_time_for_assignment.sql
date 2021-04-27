-- SELECT SUM(assignment_submissions.duration) 
-- FROM students 
-- JOIN assignment_submissions on students.id = assignment_submissions.student_id
-- WHERE students.cohort_id =
-- (
--   SELECT id as corhort_id
--   FROM cohorts
--   WHERE name = 'FEB12');
SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';

