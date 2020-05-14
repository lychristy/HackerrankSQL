SELECT player_id,
       device_id
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
   FROM Activity) table1
WHERE rn = 1