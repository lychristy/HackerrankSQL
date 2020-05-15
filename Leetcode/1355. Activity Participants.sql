SELECT activity AS ACTIVITY
FROM Friends
GROUP BY activity
HAVING count(*) !=
  (SELECT top 1 CASE
                    WHEN count(*) IS NULL THEN 0
                    ELSE count(*)
                END
   FROM Activities a
   LEFT JOIN Friends f ON f.activity = a.name
   GROUP BY a.name
   ORDER BY CASE
                WHEN count(*) IS NULL THEN 0
                ELSE count(*)
            END DESC)
AND count(*) !=
  (SELECT top 1 CASE
                    WHEN count(*) IS NULL THEN 0
                    ELSE count(*)
                END
   FROM Activities a
   LEFT JOIN Friends f ON f.activity = a.name
   GROUP BY a.name
   ORDER BY CASE
                WHEN count(*) IS NULL THEN 0
                ELSE count(*)
            END)