SELECT b.book_id,
       b.name
FROM Books b
LEFT JOIN Orders o ON b.book_id = o.book_id
WHERE datediff(DAY, b.available_from, '2019-06-23')>=30
GROUP BY b.book_id,
         b.name
HAVING sum(CASE WHEN datediff(DAY, o.dispatch_date, '2019-06-23')<=365
                    AND o.dispatch_date < '2019-06-23' THEN quantity ELSE 0 END) < 10
ORDER BY b.book_id