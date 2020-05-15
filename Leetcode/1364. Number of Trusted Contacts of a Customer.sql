SELECT i.invoice_id,
       t1.customer_name,
       i.price,
       t1.contacts_cnt,
       t1.trusted_contacts_cnt
FROM Invoices i
LEFT JOIN
  (SELECT c.customer_id,
          c.customer_name,
          count(c2.contact_name) AS contacts_cnt,
          count(c3.customer_name) AS trusted_contacts_cnt
   FROM Customers c
   LEFT JOIN Contacts c2 ON c.customer_id = c2.user_id
   LEFT JOIN Customers c3 ON c2.contact_name = c3.customer_name
   GROUP BY c.customer_id,
            c.customer_name) t1 ON i.user_id = t1.customer_id
ORDER BY i.invoice_id