SELECT top 1 question_id AS survey_log
FROM survey_log
GROUP BY question_id
ORDER BY sum(CASE WHEN answer_id IS NOT NULL THEN 1.0 ELSE 0 END) / count(*) DESC