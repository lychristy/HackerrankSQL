SELECT t1.pay_month,
       t1.department_id,
       CASE
           WHEN dept_avg > con_avg THEN 'higher'
           WHEN dept_avg < con_avg THEN 'lower'
           ELSE 'same'
       END AS comparison
FROM
  (SELECT format(pay_date, 'yyyy-MM') AS pay_month,
          e.department_id,
          sum(amount)*1.0 / count(*) AS dept_avg
   FROM salary s
   LEFT JOIN employee e ON e.employee_id = s.employee_id
   GROUP BY e.department_id,
            format(pay_date, 'yyyy-MM')) t1
LEFT JOIN
  (SELECT format(pay_date, 'yyyy-MM') AS pay_month,
          sum(amount)*1.0 / count(*) AS con_avg
   FROM salary
   GROUP BY format(pay_date, 'yyyy-MM')) t2 ON t1.pay_month = t2.pay_month
ORDER BY t1.pay_month DESC,
         t1.department_id