SELECT student_id AS STUDENT_ID,
       student_name AS STUDENT_NAME
FROM
  (SELECT e.student_id,
          s.student_name,
          CASE WHEN score = min(score) OVER (PARTITION BY exam_id) THEN 1 ELSE 0 END AS lowest,
          CASE WHEN score = max(score) OVER (PARTITION BY exam_id) THEN 1 ELSE 0 END AS highest
   FROM Exam e
   LEFT JOIN Student s ON e.student_id = s.student_id) t1
GROUP BY student_id,
         student_name
HAVING sum(abs(lowest)) + sum(abs(highest)) = 0
ORDER BY student_id