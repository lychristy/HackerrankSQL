SELECT u.user_id,
       u.user_name,
       tbl2.credit,
       CASE WHEN tbl2.credit < 0 THEN 'Yes' ELSE 'No' END credit_limit_breached
FROM Users u
LEFT JOIN
  (SELECT user_id, sum(credit) credit
   FROM
     (SELECT paid_by user_id, -amount credit FROM Transactions
      UNION ALL 
	  SELECT paid_to user_id, amount credit FROM Transactions
      UNION ALL 
	  SELECT user_id, credit FROM Users) tbl1
   GROUP BY user_id) tbl2 
ON u.user_id = tbl2.user_id
ORDER BY u.user_id