SELECT e1.employee_id AS EMPLOYEE_ID
FROM Employees e1,
               Employees e2,
                         Employees e3,
                                   Employees e4
WHERE e1.manager_id = e2.employee_id
  AND e2.manager_id = e3.employee_id
  AND e3.manager_id = e4.employee_id
  AND e4.manager_id = 1
  AND e1.employee_id != 1
ORDER BY e1.employee_id