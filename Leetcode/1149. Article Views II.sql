SELECT DISTINCT viewer_id AS id
FROM VIEWS
GROUP BY viewer_id,
         view_date
HAVING count(DISTINCT article_id) > 1