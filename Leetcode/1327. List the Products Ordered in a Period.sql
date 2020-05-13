SELECT p.product_name AS PRODUCT_NAME,
       sum(unit) AS UNIT
FROM Orders o
LEFT JOIN Products p ON o.product_id = p.product_id
WHERE o.order_date >= '2020-02-01'
  AND o.order_date < '2020-03-01'
GROUP BY o.product_id,
         p.product_name,
         p.product_category
HAVING sum(unit) >= 100