SELECT seller_id
FROM
  (SELECT seller_id,
          rank() OVER (
                       ORDER BY sum(price) DESC) AS rn
   FROM Sales
   GROUP BY seller_id) table1
WHERE rn = 1