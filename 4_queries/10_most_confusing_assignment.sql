SELECT assignments.id, name,day,chapter,count(assignment_id) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP by assignments.id
ORDER BY total_requests DESC;