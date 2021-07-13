SELECT sale_date,
       sum(CASE WHEN fruit = 'apples' THEN sold_num ELSE 0 END) - sum(CASE WHEN fruit = 'oranges' THEN sold_num ELSE 0 END) AS diff
FROM Sales
GROUP BY sale_date
ORDER BY sale_date