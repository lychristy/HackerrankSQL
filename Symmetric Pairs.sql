/*
You are given a table, Functions, containing two columns: X and Y.

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X.
*/

select f1.X, f1.Y
from Functions f1
inner join Functions f2 on f1.X = f2.Y and f1.Y = f2.X
group by f1.X, f1.Y
having f1.X < f1.Y or count(*) > 1
order by f1.X