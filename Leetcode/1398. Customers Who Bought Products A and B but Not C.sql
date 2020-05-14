SELECT DISTINCT o.customer_id AS CUSTOMER_ID,
                customer_name AS CUSTOMER_NAME
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id
WHERE product_name = 'A'
  AND o.customer_id IN
    (SELECT customer_id FROM Orders WHERE product_name = 'B')
  AND o.customer_id NOT IN
    (SELECT customer_id FROM Orders WHERE product_name = 'C')