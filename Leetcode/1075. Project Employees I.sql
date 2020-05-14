SELECT p.project_id,
       cast(round(avg(e.experience_years*1.0), 2) AS numeric(36, 2)) AS average_years
FROM Project p
LEFT JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id
ORDER BY p.project_id