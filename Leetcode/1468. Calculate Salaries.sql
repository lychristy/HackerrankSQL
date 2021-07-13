SELECT company_id,
       employee_id,
       employee_name,
       CASE
           WHEN max(salary) OVER (PARTITION BY company_id) < 1000 THEN cast(round(salary, 0) AS numeric(10, 0))
           WHEN max(salary) OVER (PARTITION BY company_id) >= 10000 THEN cast(round(salary * (1-0.49), 0) AS numeric(10, 0))
           ELSE cast(round(salary * (1-0.24), 0) AS numeric(10, 0)) END salary
FROM Salaries