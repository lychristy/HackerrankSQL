SELECT tbl1.spend_date,
       tbl1.platform,
       sum(CASE WHEN tbl2.total_amount IS NULL THEN 0 ELSE total_amount END) AS total_amount,
       count(tbl2.spend_date) total_users
FROM
  (SELECT DISTINCT spend_date, 'desktop' platform, 1 rn FROM Spending
   UNION 
   SELECT DISTINCT spend_date, 'mobile' platform, 2 rn FROM Spending
   UNION 
   SELECT DISTINCT spend_date, 'both' platform, 3 rn FROM Spending) tbl1
LEFT JOIN
  (SELECT user_id, spend_date, 'both' platform, sum(amount) total_amount
   FROM Spending
   GROUP BY user_id, spend_date
   HAVING count(*) = 2
   UNION 
   SELECT user_id, spend_date, max(platform), sum(amount) total_amount
   FROM Spending
   GROUP BY user_id, spend_date
   HAVING count(*) = 1) tbl2 
ON tbl1.spend_date = tbl2.spend_date
AND tbl1.platform = tbl2.platform
GROUP BY tbl1.spend_date, tbl1.platform, tbl1.rn
ORDER BY tbl1.rn, tbl1.spend_date