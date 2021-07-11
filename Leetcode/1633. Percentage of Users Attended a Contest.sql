SELECT *
FROM
  (SELECT contest_id,
          cast(round(count(*) * 100.0 / (SELECT count(*) FROM Users), 2) AS numeric(10, 2)) AS percentage
   FROM Register
   GROUP BY contest_id) tbl1
ORDER BY percentage DESC,
         contest_id