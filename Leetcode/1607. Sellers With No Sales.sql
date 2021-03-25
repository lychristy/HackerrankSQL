SELECT seller_name
FROM Seller
WHERE seller_id not in
    (SELECT DISTINCT seller_id
     FROM Orders
     WHERE datepart(YEAR, sale_date) = 2020 )
ORDER BY seller_name