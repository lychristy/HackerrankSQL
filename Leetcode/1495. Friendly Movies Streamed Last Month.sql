SELECT DISTINCT title
FROM Content
WHERE Kids_content = 'Y'
  AND content_type = 'movies'
  AND content_id in
    (SELECT content_id
     FROM TVProgram
     WHERE format(program_date, 'yyyy-MM') = '2020-06')