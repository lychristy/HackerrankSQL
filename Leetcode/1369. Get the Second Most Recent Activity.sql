SELECT username AS USERNAME,
       activity AS ACTIVITY,
       startDate AS STARTDATE,
       endDate AS ENDDATE
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY username ORDER BY startDate DESC) AS rn,
          count(*) OVER (PARTITION BY username) AS totalActivities
   FROM UserActivity) t1
WHERE (rn = 1 AND totalactivities = 1)
  OR rn = 2