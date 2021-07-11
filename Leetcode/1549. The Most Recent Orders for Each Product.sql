SELECT product_name,
       product_id,
       order_id,
       order_date
FROM
  (SELECT p.product_name,
          p.product_id,
          o.order_id,
          o.order_date,
          rank() OVER (PARTITION BY p.product_id ORDER BY o.order_date DESC) AS rn
   FROM Products p
   LEFT JOIN Orders o ON p.product_id = o.product_id) tbl1
WHERE rn = 1 AND order_id IS NOT NULL
ORDER BY product_name,
         product_id,
         order_id