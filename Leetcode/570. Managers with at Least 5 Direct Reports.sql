SELECT e2.Name
FROM Employee e1,
              Employee e2
WHERE e1.ManagerId = e2.Id
  AND e1.ManagerId IS NOT NULL
GROUP BY e2.Name
HAVING count(*) >= 5



SELECT Name
FROM Employee
WHERE Id IN
    (SELECT ManagerId
     FROM Employee
     WHERE ManagerId IS NOT NULL
     GROUP BY ManagerId
     HAVING count(*) >= 5)