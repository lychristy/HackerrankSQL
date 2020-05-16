SELECT d.dept_name,
       CASE
           WHEN count(s.dept_id) IS NULL THEN 0
           ELSE count(s.dept_id)
       END AS student_number
FROM department d
LEFT JOIN student s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
ORDER BY count(s.dept_id) DESC, d.dept_name