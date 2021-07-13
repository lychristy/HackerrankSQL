SELECT user_id,
       max(biggest_window) AS biggest_window
FROM
  (SELECT *,
          datediff(DAY, lag(visit_date, 1) OVER (PARTITION BY user_id ORDER BY visit_date), visit_date) AS biggest_window
   FROM
     (SELECT DISTINCT user_id, '2021-01-01' AS visit_date
      FROM UserVisits

      UNION ALL SELECT *

      FROM UserVisits) tbl1) tbl2
GROUP BY user_id
ORDER BY user_id