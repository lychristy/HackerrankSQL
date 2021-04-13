SELECT visited_on,
       amount,
       cast(amount*1.0/7 AS numeric(36, 2)) AS average_amount
FROM
  (SELECT visited_on,
          sum(amount*1.0) OVER (ORDER BY visited_on ROWS BETWEEN 6 preceding AND CURRENT ROW) AS amount
   FROM
     (SELECT visited_on, sum(amount) AS amount
      FROM Customer
      GROUP BY visited_on) t1) t2
WHERE datediff(DAY,(SELECT min(visited_on) FROM Customer), visited_on) >= 6