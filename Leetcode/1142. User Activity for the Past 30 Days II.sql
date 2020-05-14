SELECT CASE
           WHEN count(distinct(user_id))=0 THEN 0
           ELSE cast(round(count(distinct(session_id))*1.0/ count(distinct(user_id)), 2) AS numeric(36, 2))
       END AS average_sessions_per_user
FROM Activity
WHERE activity_date <= '2019-07-27'
  AND datediff(DAY, activity_date, '2019-07-27') <= 29