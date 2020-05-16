SELECT product_id,
year AS first_year,
               quantity,
               price
FROM
  (SELECT *,
          rank() OVER (PARTITION BY product_id ORDER BY year) AS rn
   FROM Sales) t1
WHERE rn = 1