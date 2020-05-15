SELECT top 1 person_name
FROM
  (SELECT *,
          sum(weight) OVER (ORDER BY turn) AS total_weight
   FROM Queue) t1
WHERE total_weight <= 1000
ORDER BY total_weight DESC