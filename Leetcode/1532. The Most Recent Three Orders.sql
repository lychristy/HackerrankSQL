SELECT name AS customer_name,
       customer_id,
       order_id,
       order_date
FROM
  (SELECT c.name,
          c.customer_id,
          o.order_id,
          o.order_date,
          row_number() OVER (PARTITION BY c.customer_id ORDER BY order_date DESC) AS rn
   FROM Customers c
   LEFT JOIN Orders o ON c.customer_id = o.customer_id) tbl1
WHERE rn <= 3 AND order_date IS NOT NULL
ORDER BY name, customer_id, order_date DESC