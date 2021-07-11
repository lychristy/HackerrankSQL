SELECT sell_date,
       count(*) AS num_sold,
       string_agg(product, ',') within GROUP (ORDER BY product) AS products
FROM
  (SELECT DISTINCT sell_date, product
   FROM Activities) tbl1
GROUP BY sell_date
ORDER BY sell_date