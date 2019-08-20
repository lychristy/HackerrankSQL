/*
Julia conducted a 15 days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least 1 submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.
*/
select c.submission_date, c.unique_hacker, b.hacker_id, b.name
from (select a.submission_date, count(distinct(hacker_id)) as unique_hacker
      from (select *,
            dense_rank() over (order by submission_date) as rn1,
            dense_rank() over (partition by hacker_id order by submission_date) as rn2
            from Submissions) a
      where a.rn1 = a.rn2
      group by a.submission_date) c
left join (select s_data1.submission_date, s_data1.hacker_id, s_data1.name
           from (select *,
                 row_number() over (partition by s_data.submission_date
                                    order by s_data.sub_count desc, hacker_id) as rn
                 from (select s.submission_date, s.hacker_id, count(distinct(submission_id)) as sub_count, h.name
                       from Submissions s
                       left join Hackers h on s.hacker_id = h.hacker_id
                       group by s.submission_date, s.hacker_id, h.name) s_data) s_data1
           where s_data1.rn = 1) b
on c.submission_date = b.submission_date
order by c.submission_date;