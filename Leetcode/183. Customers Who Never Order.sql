SELECT Name AS Customers
FROM Customers c
WHERE Id NOT IN
    (SELECT CustomerId
     FROM Orders)