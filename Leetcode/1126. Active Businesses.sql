SELECT business_id
FROM
  (SELECT *,
          CASE
              WHEN occurences - avg(occurences * 1.0) OVER (PARTITION BY event_type) > 0 THEN 1
              ELSE 0
          END AS diff
   FROM EVENTS) t1
GROUP BY business_id
HAVING count(distinct(event_type)) >= 2
AND sum(diff) >= 2