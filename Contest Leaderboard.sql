/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.
*/
select h.hacker_id, h.name, sum(s_data1.score)
from (select *
      from (select *,
            row_number() over (partition by hacker_id, challenge_id
                               order by score desc) as rn
            from Submissions) s_data
      where s_data.rn = 1) s_data1
left join Hackers h
on s_data1.hacker_id = h.hacker_id
group by h.hacker_id, h.name
having sum(s_data1.score) > 0
order by sum(s_data1.score) desc, h.hacker_id