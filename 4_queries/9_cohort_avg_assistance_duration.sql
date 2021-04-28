SELECT avg(total_assistance_duration) as average_total_duration
FROM 
(SELECT SUM(completed_at - started_at) as total_assistance_duration
FROM cohorts
JOIN students ON cohort_id = cohorts.id
JOIN assistance_requests ON student_id = students.id
GROUP by cohorts.name) as total_assistance_duration;
