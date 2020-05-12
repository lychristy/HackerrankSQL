--Produce a list of facilities along with their total revenue. The output table should consist of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!

SELECT name,
       sum(slots * CASE
                       WHEN memid = 0 THEN guestcost
                       ELSE membercost
                   END) AS revenue
FROM cd.facilities f
INNER JOIN cd.bookings b ON f.facid = b.facid
GROUP BY name
ORDER BY revenue