SELECT employee_id, department_id
FROM Employee
WHERE employee_id in (SELECT employee_id FROM Employee GROUP BY employee_id HAVING count(*) = 1)
UNION
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'



--method 2--
SELECT employee_id,
       department_id
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY employee_id ORDER BY primary_flag DESC) AS rn
   FROM Employee) tbl1
WHERE rn = 1