SELECT customer_id,
       sum(CASE WHEN t.transaction_id IS NULL THEN 1 ELSE 0 END) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY customer_id