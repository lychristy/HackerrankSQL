/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

*/


select h.hacker_id, h.name, count(*)
from Challenges c 
inner join Hackers h on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having count(*) in (select top 1 count(*)
                   from Challenges
                   group by hacker_id
                   order by count(*) desc) or
        count(*) in  (select no_created
                     from (select hacker_id, count(*) as no_created
                           from Challenges
                           group by hacker_id) nc
                     group by nc.no_created
                     having count(*) < 2)
order by count(*) desc, hacker_id
