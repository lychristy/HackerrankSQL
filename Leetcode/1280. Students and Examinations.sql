SELECT table1.student_id,
       table1.student_name,
       table1.subject_name,
       count(e.subject_name) AS attended_exams
FROM
  (SELECT *
   FROM Students,
        Subjects) table1
LEFT JOIN Examinations e ON e.student_id = table1.student_id
AND e.subject_name = table1.subject_name
GROUP BY table1.student_id,
         table1.student_name,
         table1.subject_name