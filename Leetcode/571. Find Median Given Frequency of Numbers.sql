SELECT cast(round(avg(Number*1.0), 1) AS decimal(10, 1)) AS median
FROM
  (SELECT *,
          sum(Frequency) OVER (ORDER BY Number) AS cumFre,
          sum(Frequency) OVER (ORDER BY Number DESC) AS cumFreDesc
   FROM Numbers) tbl1
WHERE cumFre >= (SELECT sum(Frequency)/2 FROM Numbers)
  AND cumFreDesc >= (SELECT sum(Frequency)/2 FROM Numbers)