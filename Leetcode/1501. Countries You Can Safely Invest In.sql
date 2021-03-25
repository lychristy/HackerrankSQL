SELECT c1.name AS country
FROM Country c1
LEFT JOIN Person p ON c1.country_code = substring(p.phone_number, 1, 3)
LEFT JOIN Calls c2 ON p.id = c2.caller_id
OR p.id = c2.callee_id
GROUP BY c1.name
HAVING avg(c2.duration*1.0) > (SELECT avg(duration*1.0) FROM Calls)