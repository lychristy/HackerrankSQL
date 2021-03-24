SELECT Request_at AS Day,
       cast(round(sum(CASE WHEN Status = 'completed' THEN 0 ELSE 1 END) * 1.0 / count(*), 2) AS numeric(36, 2)) AS 'Cancellation Rate'
FROM Trips
WHERE Client_Id in (SELECT Users_Id FROM Users WHERE Banned = 'No')
  AND Driver_Id in (SELECT Users_Id FROM Users WHERE Banned = 'No')
  AND Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY Request_at
ORDER BY Request_at