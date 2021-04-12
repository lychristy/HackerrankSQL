SELECT Id,
       Company,
       Salary
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY Company ORDER BY Salary, Id) AS rn,
          row_number() OVER (PARTITION BY Company ORDER BY Salary DESC, Id DESC) AS rn1
   FROM Employee) t1
WHERE rn - rn1 in (-1,0,1)
ORDER BY Company,
         Salary