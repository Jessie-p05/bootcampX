SELECT day, count(*) as total_assignments 
FROM assignments
GROUP BY day
Having Count(*) >= 10
ORDER BY day;