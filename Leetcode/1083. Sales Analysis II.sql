SELECT distinct(s1.buyer_id)
FROM Product p1
LEFT JOIN Sales s1 ON p1.product_id = s1.product_id
WHERE p1.product_name = 'S8'
  AND s1.buyer_id NOT IN
    (SELECT s.buyer_id
     FROM Product p
     LEFT JOIN Sales s ON s.product_id = p.product_id
     WHERE p.product_name = 'iPhone')
------------------------------------------------------------
SELECT s.buyer_id
FROM Sales s
LEFT JOIN Product p ON s.product_id = p.product_id
GROUP BY s.buyer_id
HAVING sum(CASE WHEN product_name = 'S8' THEN 1 ELSE 0 END) >= 1 AND sum(CASE WHEN product_name = 'iPhone' THEN 1 ELSE 0 END) = 0
ORDER BY s.buyer_id