SELECT Department,
       Name AS Employee,
       Salary
FROM
  (SELECT d.Name AS Department,
          e.Name,
          e.Salary,
          dense_rank() OVER (PARTITION BY d.Name ORDER BY e.Salary DESC) AS rn
   FROM Department d
   LEFT JOIN Employee e ON d.Id = e.DepartmentId) t1
WHERE rn <= 3
  AND t1.Salary IS NOT NULL
ORDER BY Department,
         Salary DESC