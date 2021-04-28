SELECT distinct teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN cohorts ON teachers.end_date >= cohorts.start_date or 
teachers.start_date <= cohorts.start_date
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;