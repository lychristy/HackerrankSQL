SELECT q.id,
       q.year,
       CASE
           WHEN npv IS NULL THEN 0
           ELSE npv
       END AS npv
FROM Queries q
LEFT JOIN NPV n ON q.id = n.id
AND q.year = n.year