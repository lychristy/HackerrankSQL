SELECT Request_at AS Day,
       cast(round(sum(CASE
                          WHEN Status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1.0
                          ELSE 0
                      END) / count(*), 2) AS numeric(36, 2)) AS 'Cancellation Rate'
FROM Trips
WHERE Driver_Id IN
    (SELECT Users_Id
     FROM Users
     WHERE Banned = 'No'
       AND ROLE = 'driver')
  AND Client_Id IN
    (SELECT Users_Id
     FROM Users
     WHERE Banned = 'No'
       AND ROLE = 'client')
  AND Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY Request_at
ORDER BY Request_at