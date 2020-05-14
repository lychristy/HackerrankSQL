SELECT query_name,
       cast(round(sum(rating * 1.0/ POSITION) / count(*), 2) AS numeric(36, 2)) AS quality,
       cast(round(sum(CASE
                          WHEN rating < 3 THEN 1
                          ELSE 0
                      END) * 100.0 / count(*), 2) AS numeric(36, 2)) AS poor_query_percentage
FROM Queries
GROUP BY query_name