SELECT cast(round(sum(CASE
                          WHEN order_date = customer_pref_delivery_date THEN 100.0
                          ELSE 0
                      END) / count(*), 2) AS numeric(36, 2)) AS immediate_percentage
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY customer_id
                             ORDER BY order_date) AS rn
   FROM Delivery) t1
WHERE rn = 1