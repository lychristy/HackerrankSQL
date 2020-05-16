SELECT America,
       Asia,
       Europe
FROM
  (SELECT name AS America,
          row_number() OVER (ORDER BY name) AS rn1
   FROM student
   WHERE continent = 'America'
     AND name IS NOT NULL) t1
LEFT JOIN
  (SELECT name AS Asia,
          row_number() OVER (ORDER BY name) AS rn2
   FROM student
   WHERE continent = 'Asia'
     AND name IS NOT NULL) t2 ON t1.rn1 = t2.rn2
LEFT JOIN
  (SELECT name AS Europe,
          row_number() OVER (ORDER BY name) AS rn3
   FROM student
   WHERE continent = 'Europe'
     AND name IS NOT NULL) t3 ON t1.rn1 = t3.rn3