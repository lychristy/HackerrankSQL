SELECT *
FROM
  (SELECT top 1 u.name AS results
   FROM Movie_Rating mv
   LEFT JOIN Users u ON mv.user_id = u.user_id
   GROUP BY u.name
   ORDER BY count(*) DESC, u.name) t1
UNION
SELECT *
FROM
  (SELECT top 1 m.title AS results
   FROM Movie_Rating mv
   LEFT JOIN Movies m ON mv.movie_id = m.movie_id
   WHERE mv.created_at >= '2020-02-01'
     AND mv.created_at < '2020-03-01'
   GROUP BY m.title
   ORDER BY avg(mv.rating * 1.0) DESC, m.title) t2