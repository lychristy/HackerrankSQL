SELECT p1.id AS p1,
       p2.id AS p2,
       abs(p1.x_value - p2.x_value) * abs(p1.y_value - p2.y_value) AS area
FROM Points p1,
     Points p2
WHERE p1.id < p2.id
  AND abs(p1.x_value - p2.x_value) * abs(p1.y_value - p2.y_value) > 0
ORDER BY abs(p1.x_value - p2.x_value) * abs(p1.y_value - p2.y_value) DESC, p1.id, p2.id