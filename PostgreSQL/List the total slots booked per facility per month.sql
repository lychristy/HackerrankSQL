--Produce a list of the total number of slots booked per facility per month in the year of 2012. Produce an output table consisting of facility id and slots, sorted by the id and month.
SELECT facid,
       MONTH,
       sum(slots)
FROM
  (SELECT *,
          EXTRACT (MONTH
                   FROM starttime) AS MONTH
   FROM cd.bookings
   WHERE starttime >='2012-01-01'
     AND starttime < '2013-01-01') table1
GROUP BY facid,
         MONTH
ORDER BY facid,
         MONTH