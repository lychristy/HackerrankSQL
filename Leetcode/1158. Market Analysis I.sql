SELECT u.user_id AS buyer_id,
       u.join_date,
       count(DISTINCT o.order_id) AS orders_in_2019
FROM Users u
LEFT JOIN
  (SELECT *
   FROM Orders
   WHERE datepart(YEAR, order_date) = 2019) o 
ON u.user_id = o.buyer_id
GROUP BY u.user_id, u.join_date
ORDER BY u.user_id