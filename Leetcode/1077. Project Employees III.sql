SELECT t1.project_id,
       t1.employee_id
FROM
  (SELECT p.project_id,
          p.employee_id,
          rank() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rn
   FROM Project p
   LEFT JOIN Employee e ON p.employee_id = e.employee_id) t1
WHERE rn = 1