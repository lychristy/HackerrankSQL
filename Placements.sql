/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

select s.Name
from Students s
inner join Friends f on s.ID = f.ID
left join Packages p on p.ID = f.ID
left join Packages p1 on p1.ID = f.Friend_ID
where p1.Salary > p.Salary
order by p1.Salary