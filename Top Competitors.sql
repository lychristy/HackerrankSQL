/*
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/
select h.hacker_id, h.name
from Hackers h
join Submissions s on h.hacker_id = s.hacker_id
join Challenges c on s.challenge_id= c.challenge_id
join Difficulty d on c.difficulty_level = d.difficulty_level
where d.score = s.score
group by h.hacker_id, h.name
having count(h.hacker_id) > 1
order by count(h.hacker_id) desc, h.hacker_id;
