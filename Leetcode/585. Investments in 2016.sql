SELECT sum(TIV_2016) AS TIV_2016
FROM
  (SELECT *,
          count(*) OVER (PARTITION BY TIV_2015) AS same_values_2015,
          count(*) OVER (PARTITION BY LAT, LON) AS same_city
   FROM insurance) tbl1
WHERE same_values_2015 > 1 AND same_city = 1