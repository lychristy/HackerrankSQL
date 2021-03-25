SELECT e1.employee_id,
       e1.name,
       count(*) AS reports_count,
       cast(round(avg(e2.age*1.0), 0) AS decimal(10, 0)) AS average_age
FROM Employees e1, Employees e2
WHERE e1.employee_id = e2.reports_to AND e2.employee_id IS NOT NULL
GROUP BY e1.employee_id, e1.name
ORDER BY e1.employee_id