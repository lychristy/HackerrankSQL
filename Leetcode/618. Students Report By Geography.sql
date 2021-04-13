SELECT min(CASE WHEN continent = 'America' THEN name ELSE NULL END) AS America,
       min(CASE WHEN continent = 'Asia' THEN name ELSE NULL END) AS Asia,
       min(CASE WHEN continent = 'Europe' THEN name ELSE NULL END) AS Europe
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY continent ORDER BY name) AS rn
   FROM student) tbl1
GROUP BY rn