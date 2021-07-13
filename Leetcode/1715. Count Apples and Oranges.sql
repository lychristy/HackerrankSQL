SELECT sum(b.apple_count) + sum(CASE WHEN c.apple_count IS NULL THEN 0 ELSE c.apple_count END) AS apple_count,
       sum(b.orange_count) + sum(CASE WHEN c.orange_count IS NULL THEN 0 ELSE c.orange_count END) AS orange_count
FROM Boxes b
LEFT JOIN Chests c ON b.chest_id = c.chest_id