CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS BEGIN RETURN
  (/* Write your T-SQL query statement below. */ 
   SELECT avg(Salary) AS getNthHighestSalary
   FROM
     (SELECT *,
             dense_rank() OVER ( ORDER BY Salary DESC) AS rn
      FROM Employee) t1
   WHERE rn = @N ); 
END