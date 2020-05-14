SELECT activity_date AS DAY,
       count(distinct(user_id)) AS active_users
FROM Activity
WHERE activity_date <= '2019-07-27'
  AND datediff(DAY, activity_date, '2019-07-27') <= 29
GROUP BY activity_date