SELECT activity_date AS login_date,
       count(*) AS user_count
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY user_id ORDER BY activity_date) AS rn
   FROM Traffic
   WHERE activity = 'login') t1
WHERE rn = 1
  AND datediff(DAY, activity_date, '2019-06-30') <=90
GROUP BY activity_date