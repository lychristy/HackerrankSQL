--Produce a list of the total number of slots booked per facility. For now, just produce an output table consisting of facility id and slots, sorted by facility id.
SELECT facid,
       sum(slots)
FROM
  (SELECT f.facid,
          b.slots
   FROM cd.facilities f
   LEFT JOIN cd.bookings b ON f.facid = b.facid) table1
GROUP BY facid
ORDER BY facid