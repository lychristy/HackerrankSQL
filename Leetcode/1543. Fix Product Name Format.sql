SELECT product_name,
       sale_date,
       count(*) AS total
FROM
  (SELECT trim(' ' FROM lower(product_name)) AS product_name, format(sale_date, 'yyyy-MM') AS sale_date
   FROM Sales) tbl1
GROUP BY product_name, sale_date
ORDER BY product_name, sale_date