select max(Salary) as SecondHighestSalary from (select Salary,
dense_rank() over (order by Salary desc) as rn 
from Employee
group by Salary) t1
where rn = 2