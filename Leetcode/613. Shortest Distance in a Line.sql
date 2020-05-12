SELECT min(abs(p1.x - p2.x)) AS shortest
FROM POINT p1,
           POINT p2
WHERE p1.x != p2.x