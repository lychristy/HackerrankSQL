SELECT max(num) AS num
FROM
  (SELECT num
   FROM my_numbers
   GROUP BY num
   HAVING count(*) = 1) table1