--Output the facility id that has the highest number of slots booked. For bonus points, try a version without a LIMIT clause. This version will probably look messy!

SELECT facid,
       total
FROM
  (SELECT *,
          row_number() OVER (
                             ORDER BY total DESC) AS rn
   FROM
     (SELECT facid,
             sum(slots) AS total
      FROM cd.bookings
      GROUP BY facid) table1) table2
WHERE rn = 1