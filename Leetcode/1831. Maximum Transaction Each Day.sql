SELECT transaction_id
FROM
  (SELECT *,
          rank() OVER (PARTITION BY datepart(DAY, DAY) ORDER BY amount DESC) AS rn
   FROM Transactions) tbl1
WHERE rn = 1
ORDER BY transaction_id