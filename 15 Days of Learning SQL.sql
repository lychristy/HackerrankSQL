/*
Julia conducted a 15 days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least 1 submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.
*/
SELECT c.submission_date,
       c.unique_hacker,
       b.hacker_id,
       b.name
FROM
  (SELECT a.submission_date,
          count(distinct(hacker_id)) AS unique_hacker
   FROM
     (SELECT *,
             dense_rank() OVER (
                                ORDER BY submission_date) AS rn1,
                               dense_rank() OVER (PARTITION BY hacker_id
                                                  ORDER BY submission_date) AS rn2
      FROM Submissions) a
   WHERE a.rn1 = a.rn2
   GROUP BY a.submission_date) c
LEFT JOIN
  (SELECT s_data1.submission_date,
          s_data1.hacker_id,
          s_data1.name
   FROM
     (SELECT *,
             row_number() OVER (PARTITION BY s_data.submission_date
                                ORDER BY s_data.sub_count DESC, hacker_id) AS rn
      FROM
        (SELECT s.submission_date,
                s.hacker_id,
                count(distinct(submission_id)) AS sub_count,
                h.name
         FROM Submissions s
         LEFT JOIN Hackers h ON s.hacker_id = h.hacker_id
         GROUP BY s.submission_date,
                  s.hacker_id,
                  h.name) s_data) s_data1
   WHERE s_data1.rn = 1) b ON c.submission_date = b.submission_date
ORDER BY c.submission_date;