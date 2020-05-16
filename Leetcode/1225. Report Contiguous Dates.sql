SELECT*
FROM
  (SELECT 'failed' AS period_state,
          min(fail_date) AS start_date,
          max(fail_date) AS end_date
   FROM
     (SELECT fail_date,
             rn1 - rn2 AS diff
      FROM
        (SELECT *,
                datediff(DAY, min(fail_date) OVER (ORDER BY fail_date), fail_date) AS rn1,
                row_number() OVER ORDER BY fail_date) - 1 AS rn2
         FROM Failed
         WHERE format(fail_date, 'yyyy') = 2019) t1) t2
   GROUP BY diff) t3
UNION ALL
SELECT*
FROM
  (SELECT 'succeeded' AS period_state,
          min(success_date) AS start_date,
          max(success_date) AS end_start
   FROM
     (SELECT success_date,
             rn1 - rn2 AS diff
      FROM
        (SELECT *,
                datediff(DAY, min(success_date) OVER (ORDER BY success_date), success_date) AS rn1,
                row_number() OVER (ORDER BY success_date) - 1 AS rn2
         FROM Succeeded
         WHERE format(success_date, 'yyyy') = 2019) t1) t2
   GROUP BY diff) t4
ORDER BY start_date