/*
Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds 1 screening 
*/
select ct.contest_id, ct.hacker_id, ct.name,
sum(ss.sum_total_subs),
sum(ss.sum_total_acc_subs),
sum(vs.sum_total_views),
sum(vs.sum_total_unique_views)
from Contests ct
left join Colleges cl on ct.contest_id = cl.contest_id
left join Challenges ch on cl.college_id = ch.college_id
left join (select challenge_id, 
           sum(total_views) as sum_total_views,
           sum(total_unique_views) as sum_total_unique_views
          from View_Stats
          group by challenge_id) vs
on vs.challenge_id = ch.challenge_id
left join (select challenge_id,
           sum(total_submissions) as sum_total_subs,
           sum(total_accepted_submissions) as sum_total_acc_subs
          from Submission_Stats
          group by challenge_id) ss
on ss.challenge_id = ch.challenge_id
group by ct.contest_id, ct.hacker_id, ct.name
having sum(ss.sum_total_subs)+
    sum(ss.sum_total_acc_subs)+
    sum(vs.sum_total_views)+
    sum(vs.sum_total_unique_views) > 0
order by ct.contest_id
