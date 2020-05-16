SELECT format(trans_date, 'yyyy-MM') AS MONTH,
       t1.country,
       sum(CASE WHEN t1.state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
       sum(CASE WHEN t1.state = 'approved' THEN amount ELSE 0 END) AS approved_amount,
       sum(CASE WHEN t1.state = 'chargeback' THEN 1 ELSE 0 END) AS chargeback_count,
       sum(CASE WHEN t1.state = 'chargeback' THEN amount ELSE 0 END) AS chargeback_amount
FROM
  (SELECT *
   FROM Transactions
   UNION ALL SELECT c.trans_id,
                    t.country,
                    'chargeback' AS state,
                    t.amount,
                    c.trans_date
   FROM Chargebacks c
   LEFT JOIN Transactions t ON t.id = c.trans_id) t1
GROUP BY format(trans_date, 'yyyy-MM'),
         t1.country
HAVING sum(CASE WHEN t1.state = 'approved' THEN 1 ELSE 0 END) + sum(CASE WHEN t1.state = 'chargeback' THEN 1 ELSE 0 END) > 0