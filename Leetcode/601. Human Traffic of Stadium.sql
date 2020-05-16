SELECT id,
       visit_date,
       people
FROM
  (SELECT *,
          count(*) OVER (PARTITION BY diff) AS MoreThan3Days
   FROM
     (SELECT *,
             id - row_number() OVER (ORDER BY visit_date) AS diff
      FROM stadium
      WHERE people >= 100) t1) t2
WHERE MoreThan3Days >= 3