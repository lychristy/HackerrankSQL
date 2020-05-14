SELECT distinct(s1.buyer_id)
FROM Product p1
LEFT JOIN Sales s1 ON p1.product_id = s1.product_id
WHERE p1.product_name = 'S8'
  AND s1.buyer_id NOT IN
    (SELECT s.buyer_id
     FROM Product p
     LEFT JOIN Sales s ON s.product_id = p.product_id
     WHERE p.product_name = 'iPhone')