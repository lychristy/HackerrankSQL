SELECT p.name,
       sum(rest) AS rest,
       sum(paid) AS paid,
       sum(canceled) AS canceled,
       sum(refunded) AS refunded
FROM Invoice i
LEFT JOIN Product p ON i.product_id = p.product_id
GROUP BY i.product_id, p.name
ORDER BY p.name