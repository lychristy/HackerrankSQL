--Produce a list of facilities with a total revenue less than 1000. Produce an output table consisting of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!
SELECT *
FROM
  (SELECT name,
          sum(slots * CASE
                          WHEN memid = 0 THEN guestcost
                          ELSE membercost
                      END) AS revenue
   FROM cd.facilities f
   INNER JOIN cd.bookings b ON f.facid = b.facid
   GROUP BY name) table1
WHERE revenue <1000
ORDER BY revenue