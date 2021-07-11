SELECT c.customer_id,
       c.name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Product p ON o.product_id = p.product_id
GROUP BY c.customer_id,
         c.name
HAVING sum(CASE WHEN datepart(YEAR, order_date) = 2020 AND datepart(MONTH, order_date) = 6 THEN quantity*price ELSE 0 END) >= 100
AND sum(CASE WHEN datepart(YEAR, order_date) = 2020 AND datepart(MONTH, order_date) = 7 THEN quantity*price ELSE 0 END) >= 100