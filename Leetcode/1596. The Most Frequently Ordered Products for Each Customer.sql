SELECT customer_id,
       product_id,
       product_name
FROM
  (SELECT *,
          rank() OVER (PARTITION BY customer_id ORDER BY COUNT DESC) AS rn
   FROM
     (SELECT o.customer_id,
             p.product_id,
             p.product_name,
             count(*) AS COUNT
      FROM Orders o
      LEFT JOIN Products p ON o.product_id = p.product_id
      GROUP BY o.customer_id,
               p.product_id,
               p.product_name) tbl1) tbl2
WHERE rn = 1