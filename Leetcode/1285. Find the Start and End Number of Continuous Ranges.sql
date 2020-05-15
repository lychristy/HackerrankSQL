SELECT min(log_id) AS START_ID,
       max(log_id) AS END_ID
FROM
  (SELECT *,
          row_number() OVER (ORDER BY log_id) - log_id AS diff
   FROM Logs) t1
GROUP BY diff
ORDER BY diff DESC