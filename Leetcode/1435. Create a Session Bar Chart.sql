SELECT bin AS BIN,
       count(*) - 1 AS TOTAL
FROM
  (SELECT CASE
              WHEN duration < 5*60 THEN '[0-5>'
              WHEN duration < 10*60 THEN '[5-10>'
              WHEN duration < 15*60 THEN '[10-15>'
              ELSE '15 or more'
          END AS bin
   FROM Sessions s
   UNION ALL SELECT '[0-5>' AS bin
   UNION ALL SELECT '[5-10>' AS bin
   UNION ALL SELECT '[10-15>' AS bin
   UNION ALL SELECT '15 or more' AS bin) table1
GROUP BY bin


--------------------------
SELECT '[0-5>' AS bin,count(*) AS total FROM Sessions WHERE duration < 5*60
UNION ALL
SELECT '[5-10>' AS bin, count(*) AS total FROM Sessions WHERE duration >= 5*60 AND duration < 10*60
UNION ALL
SELECT '[10-15>' AS bin, count(*) AS total FROM Sessions WHERE duration >= 10*60 AND duration < 15*60
UNION ALL
SELECT '15 or more' AS bin, count(*) AS total FROM Sessions WHERE duration >= 15*60