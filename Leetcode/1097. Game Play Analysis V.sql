SELECT event_date AS install_dt,
       count(*) AS installs,
       cast(round(count(second_date) * 1.0 / count(*), 2) AS numeric(36, 2)) AS Day1_retention
FROM
  (SELECT a1.event_date,
          a2.event_date AS second_date,
          row_number() OVER (PARTITION BY a1.player_id ORDER BY a1.event_date) AS rn
   FROM Activity a1
   LEFT JOIN Activity a2 ON datediff(DAY, a1.event_date, a2.event_date)= 1
   AND a1.player_id = a2.player_id) t1
WHERE rn = 1
GROUP BY event_date
ORDER BY event_date