SELECT user_id,
       max(time_stamp) AS last_stamp
FROM Logins
WHERE datepart(YEAR, time_stamp) = 2020
GROUP BY user_id