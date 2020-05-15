SELECT DISTINCT p.product_id,
                CASE
                    WHEN t2.new_price IS NULL THEN 10
                    ELSE t2.new_price
                END AS price
FROM Products p
LEFT JOIN
  (SELECT product_id,
          new_price
   FROM
     (SELECT product_id,
             new_price,
             row_number() OVER (PARTITION BY product_id
                                ORDER BY change_date DESC) rn
      FROM Products
      WHERE change_date <= '2019-08-16') t1
   WHERE rn = 1) t2 ON t2.product_id = p.product_id