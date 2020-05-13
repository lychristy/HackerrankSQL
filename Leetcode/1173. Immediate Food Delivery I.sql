SELECT cast(round(sum(IMMEDIATE) * 100.0 / count(*), 2) AS numeric(36, 2)) AS immediate_percentage
FROM
  (SELECT *,
          CASE
              WHEN order_date = customer_pref_delivery_date THEN 1
              ELSE 0
          END AS IMMEDIATE
   FROM Delivery) d