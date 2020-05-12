SELECT employee_id,
       e2.team_size
FROM Employee e1
LEFT JOIN
  (SELECT team_id,
          count(*) AS team_size
   FROM Employee
   GROUP BY team_id) e2 ON e1.team_id = e2.team_id