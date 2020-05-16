SELECT team_id,
       team_name,
       CASE
           WHEN num_points IS NULL THEN 0
           ELSE num_points
       END AS num_points
FROM
  (SELECT t.team_id,
          t.team_name,
          sum(CASE
                  WHEN host_team = team_id THEN host_score
                  WHEN guest_team = team_id THEN guest_score END) AS num_points
   FROM Teams t
   LEFT JOIN
     (SELECT *,
             CASE
                 WHEN host_goals > guest_goals THEN 3
                 WHEN host_goals = guest_goals THEN 1
                 ELSE 0 END AS host_score,
             CASE
                 WHEN host_goals < guest_goals THEN 3
                 WHEN host_goals = guest_goals THEN 1
                 ELSE 0 END AS guest_score
      FROM Matches) m ON t.team_id = m.host_team
   OR t.team_id = m.guest_team
   GROUP BY t.team_id,
            t.team_name) t1
ORDER BY num_points DESC,
         team_id