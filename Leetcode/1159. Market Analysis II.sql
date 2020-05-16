SELECT u.user_id AS seller_id,
       CASE
           WHEN u.favorite_brand = t2.item_brand THEN 'yes'
           ELSE 'no'
       END AS '2nd_item_fav_brand'
FROM Users u
LEFT JOIN
  (SELECT *
   FROM
     (SELECT seller_id,
             i.item_brand,
             row_number() OVER (PARTITION BY seller_id ORDER BY order_date) AS rn
      FROM Orders o
      LEFT JOIN Items i ON o.item_id = i.item_id) t1
   WHERE rn = 2) t2 ON u.user_id = t2.seller_id