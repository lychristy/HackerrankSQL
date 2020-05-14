SELECT extra AS report_reason,
       count(distinct(post_id)) AS report_count
FROM Actions
WHERE action_date = '2019-07-04'
  AND action = 'report'
GROUP BY extra