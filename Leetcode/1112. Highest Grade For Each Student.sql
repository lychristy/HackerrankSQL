SELECT student_id,
       course_id,
       grade
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY student_id
                             ORDER BY grade DESC, course_id) AS rn
   FROM Enrollments) t1
WHERE rn = 1
ORDER BY student_id