SELECT Id,
       Email
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY Email
                             ORDER BY Id) AS rn
   FROM Person) table1
WHERE rn = 1