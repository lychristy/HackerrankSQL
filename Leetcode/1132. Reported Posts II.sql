SELECT cast(round(avg(average_daily_percent), 2) AS numeric(36, 2)) AS average_daily_percent
FROM
  (SELECT count(DISTINCT r.post_id) * 100.0 / count(DISTINCT a.post_id) AS average_daily_percent
   FROM Actions a
   LEFT JOIN Removals r ON a.post_id = r.post_id
   WHERE extra = 'spam'
   GROUP BY a.action_date) t1