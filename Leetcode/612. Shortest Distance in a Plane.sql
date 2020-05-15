SELECT cast(round(min(shortest), 2) AS numeric(36, 2)) AS shortest
FROM
  (SELECT sqrt(square(p1.x * 1.0- p2.x) + square(p1.y*1.0 - p2.y)) AS shortest
   FROM point_2d p1,
        point_2d p2) t1
WHERE shortest > 0