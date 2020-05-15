SELECT cast(round(sum(TIV_2016), 2) AS numeric(36, 2)) AS TIV_2016
FROM insurance i
LEFT JOIN
  (SELECT LAT,
          LON
   FROM insurance
   GROUP BY LAT,
            LON
   HAVING count(*) = 1) t1 ON i.LAT = t1.LAT
AND i.LON = t1.LON
WHERE TIV_2015 IN
    (SELECT TIV_2015
     FROM insurance
     GROUP BY TIV_2015
     HAVING count(*) > 1)
  AND t1.LAT IS NOT NULL
  
  
  
  
SELECT cast(round(sum(TIV_2016), 2) AS numeric(36, 2)) AS TIV_2016
FROM insurance
WHERE TIV_2015 IN
    (SELECT TIV_2015
     FROM insurance
     GROUP BY TIV_2015
     HAVING count(*) > 1)
  AND concat(LAT, LON)IN
    (SELECT concat(LAT, LON)
     FROM insurance
     GROUP BY LAT,
              LON
     HAVING count(*) = 1)