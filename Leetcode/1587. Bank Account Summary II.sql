SELECT u.name,
       sum(amount) AS balance
FROM Transactions t
LEFT JOIN Users u ON t.account = u.account
GROUP BY t.account, u.name
HAVING sum(amount) > 10000