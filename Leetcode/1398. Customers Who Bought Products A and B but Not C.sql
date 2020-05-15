SELECT DISTINCT o.customer_id AS CUSTOMER_ID,
                customer_name AS CUSTOMER_NAME
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id
WHERE product_name = 'A'
  AND o.customer_id IN
    (SELECT customer_id FROM Orders WHERE product_name = 'B')
  AND o.customer_id NOT IN
    (SELECT customer_id FROM Orders WHERE product_name = 'C')
    
    
    
SELECT c.customer_id,
       c.customer_name
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id,
         c.customer_name
HAVING sum(CASE WHEN product_name = 'A' THEN 1 ELSE 0
           END) * sum(CASE WHEN product_name = 'B' THEN 1 ELSE 0
                      END) > 0
AND sum(CASE WHEN product_name = 'C' THEN 1 ELSE 0
        END) = 0
ORDER BY c.customer_id