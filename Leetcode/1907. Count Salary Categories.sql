SELECT tbl2.category,
       CASE WHEN tbl3.accounts_count IS NULL THEN 0 ELSE tbl3.accounts_count END AS accounts_count
FROM
  (SELECT 'Low Salary' AS category
   UNION ALL 
   SELECT 'Average Salary' AS category
   UNION ALL 
   SELECT 'High Salary' AS category) tbl2
LEFT JOIN
  (SELECT category,
          count(*) AS accounts_count
   FROM
     (SELECT *,
             CASE
                 WHEN income < 20000 THEN 'Low Salary'
                 WHEN income <= 50000 THEN 'Average Salary'
                 ELSE 'High Salary'
             END AS category
      FROM Accounts) tbl1
   GROUP BY category) tbl3 ON tbl2.category = tbl3.category