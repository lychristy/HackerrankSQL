SELECT t1.id,
       CASE WHEN s.student IS NULL THEN t1.student
           ELSE s.student
       END AS student
FROM
  (SELECT *,
          CASE WHEN id % 2 = 1 THEN id + 1
              ELSE id - 1
          END new_id
   FROM seat) t1
LEFT JOIN seat s ON t1.new_id = s.id