SELECT u.user_id AS buyer_id,
       u.join_date,
       CASE
           WHEN count(o.buyer_id) IS NULL THEN 0
           ELSE count(o.buyer_id)
       END AS orders_in_2019
FROM Users u
LEFT JOIN
  (SELECT*
   FROM Orders
   WHERE order_date >= '2019-01-01'
     AND order_date <'2020-01-01' ) o ON u.user_id = o.buyer_id
GROUP BY u.user_id,
         u.join_date
ORDER BY u.user_id