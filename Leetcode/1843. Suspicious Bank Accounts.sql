SELECT DISTINCT account_id
FROM
  (SELECT *,
          MONTH - lag(MONTH, 1) OVER (PARTITION BY account_id ORDER BY MONTH) AS diff
   FROM
     (SELECT t.account_id,
             datepart(MONTH, t.day) AS MONTH
      FROM Transactions t
      LEFT JOIN Accounts a ON t.account_id = a.account_id
      WHERE t.type = 'Creditor'
      GROUP BY t.account_id,
               datepart(MONTH, t.day)
      HAVING sum(t.amount) > avg(a.max_income)) tbl1) tbl2
WHERE diff = 1