SELECT format(order_date, 'yyyy-MM') AS MONTH,
       count(DISTINCT order_id) AS order_count,
       count(DISTINCT customer_id) AS customer_count
FROM Orders
WHERE invoice > 20
GROUP BY format(order_date, 'yyyy-MM')