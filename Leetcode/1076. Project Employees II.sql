SELECT project_id
FROM
  (SELECT p.project_id,
          rank() OVER (ORDER BY count(p.employee_id) DESC) AS rn
   FROM Project p
   GROUP BY project_id) table1
WHERE rn = 1