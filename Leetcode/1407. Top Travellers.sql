SELECT u.name,
       CASE
           WHEN sum(r.distance) IS NULL THEN 0
           ELSE sum(r.distance)
       END AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON r.user_id = u.id
GROUP BY r.user_id,
         u.name
ORDER BY sum(r.distance) DESC, u.name