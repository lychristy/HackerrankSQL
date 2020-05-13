SELECT customer_number
FROM
  (SELECT customer_number,
          rank() OVER (ORDER BY count(*) DESC) AS rn
   FROM orders
   GROUP BY customer_number) table1
WHERE rn = 1