SELECT Department,
       Employee,
       Salary
FROM
  (SELECT d.Name AS Department,
          e.Name AS Employee,
          e.Salary,
          dense_rank() OVER (PARTITION BY d.Name ORDER BY e.Salary DESC) AS rn
   FROM Department d
   LEFT JOIN Employee e ON e.DepartmentId = d.Id) t1
WHERE rn = 1
  AND Employee IS NOT NULL