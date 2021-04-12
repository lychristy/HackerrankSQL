SELECT status AS period_state,
       min(date) AS start_date,
       max(date) AS end_date
FROM
  (SELECT *,
          sum(number) OVER (PARTITION BY status ORDER BY date) AS sum_number
   FROM
     (SELECT *,
             CASE WHEN datediff(DAY, lag(date, 1) OVER (PARTITION BY status ORDER BY date),date) = 1 THEN 0 
                  ELSE 1 END AS number
      FROM
        (SELECT fail_date AS date, 'failed' AS status
         FROM Failed
         UNION ALL SELECT success_date AS date, 'succeeded' AS status
         FROM Succeeded) tbl1
      WHERE datepart(YEAR, date) = 2019) tbl2) tbl3
GROUP BY status, sum_number
ORDER BY min(date)