SELECT p.product_id,
       cast(round(sum(p.price * u.units) * 1.0 / sum(u.units), 2) AS numeric(36, 2)) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u ON p.product_id = u.product_id
WHERE u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id