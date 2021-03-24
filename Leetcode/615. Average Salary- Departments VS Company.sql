SELECT pay_month,
       department_id,
       CASE
           WHEN avg(diff) > 0 THEN 'higher'
           WHEN avg(diff) < 0 THEN 'lower'
           ELSE 'same'
       END AS comparison
FROM
  (SELECT format(pay_date, 'yyyy-MM') AS pay_month,
          e.department_id,
          avg(amount*1.0) OVER (PARTITION BY e.department_id,format(pay_date, 'yyyy-MM')) - avg(amount*1.0) OVER (PARTITION BY format(pay_date, 'yyyy-MM')) AS diff
   FROM salary s
   LEFT JOIN employee e ON s.employee_id = e.employee_id) tbl1
GROUP BY pay_month, department_id