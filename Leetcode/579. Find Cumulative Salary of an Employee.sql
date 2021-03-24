SELECT Id, MONTH, Salary
FROM
  (SELECT Id, MONTH,
          sum(Salary) OVER (PARTITION BY Id ORDER BY MONTH ROWS BETWEEN 2 preceding AND 0 preceding) AS Salary,
          row_number() OVER (PARTITION BY Id ORDER BY MONTH DESC) AS rn
   FROM Employee) tbl1
WHERE rn > 1
ORDER BY Id, MONTH DESC