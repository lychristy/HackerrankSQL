SELECT top 1 requester_id AS id,
           count(*) AS num
FROM
  (SELECT requester_id
   FROM request_accepted
   UNION ALL SELECT accepter_id
   FROM request_accepted) t1
GROUP BY requester_id
ORDER BY count(*) DESC