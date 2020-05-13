SELECT country_name,
       CASE
           WHEN avg(weather_state*1.0) <= 15 THEN 'Cold'
           WHEN avg(weather_state*1.0) >= 25 THEN 'Hot'
           ELSE 'Warm'
       END AS weather_type
FROM Weather w
LEFT JOIN Countries c ON w.country_id = c.country_id
WHERE DAY >= '2019-11-01'
  AND DAY < '2019-12-01'
GROUP BY country_name