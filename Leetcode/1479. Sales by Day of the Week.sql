SELECT i.item_category as category,
       sum(CASE WHEN datepart(weekday, o.order_date) = 2 THEN quantity ELSE 0 END) AS 'Monday',
       sum(CASE WHEN datepart(weekday, o.order_date) = 3 THEN quantity ELSE 0 END) AS 'Tuesday',
       sum(CASE WHEN datepart(weekday, o.order_date) = 4 THEN quantity ELSE 0 END) AS 'Wednesday',
       sum(CASE WHEN datepart(weekday, o.order_date) = 5 THEN quantity ELSE 0 END) AS 'Thursday',
       sum(CASE WHEN datepart(weekday, o.order_date) = 6 THEN quantity ELSE 0 END) AS 'Friday',
       sum(CASE WHEN datepart(weekday, o.order_date) = 7 THEN quantity ELSE 0 END) AS 'Saturday',
       sum(CASE WHEN datepart(weekday, o.order_date) = 1 THEN quantity ELSE 0 END) AS 'Sunday'
FROM Items i
LEFT JOIN Orders o ON o.item_id = i.item_id
GROUP BY i.item_category
ORDER BY item_category