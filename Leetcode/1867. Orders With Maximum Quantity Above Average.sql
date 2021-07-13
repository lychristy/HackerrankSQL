SELECT order_id
FROM
  (SELECT *,
          max(avg_quan) OVER () AS max_avg_quan
   FROM
     (SELECT order_id,
             avg(quantity*1.0) AS avg_quan,
             max(quantity) AS max_quan
      FROM OrdersDetails
      GROUP BY order_id) tbl1) tbl2
WHERE max_quan > max_avg_quan