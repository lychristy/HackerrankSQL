WITH cte AS
  (SELECT 1 AS n
   UNION ALL 
   SELECT n + 1 FROM cte WHERE n <= 19)

SELECT t.task_id,
       cte.n AS subtask_id
FROM Tasks t
CROSS JOIN cte
LEFT JOIN Executed e ON t.task_id = e.task_id AND cte.n = e.subtask_id
WHERE t.subtasks_count >= cte.n AND e.task_id IS NULL