SELECT *
FROM
  (SELECT t.team_name,
          count(*) AS matches_played,
          sum(CASE WHEN home_team_goals > away_team_goals THEN 3
                   WHEN home_team_goals = away_team_goals THEN 1 ELSE 0 END) AS points,
          sum(home_team_goals) AS goal_for,
          sum(away_team_goals) AS goal_against,
          sum(home_team_goals) - sum(away_team_goals) AS goal_diff
   FROM
     (SELECT * FROM Matches

      UNION ALL 

      SELECT away_team_id AS home_team_id,
             home_team_id AS away_team_id,
             away_team_goals AS home_team_goals,
             home_team_goals AS away_team_goals
      FROM Matches) tbl1
   LEFT JOIN Teams t ON t.team_id = tbl1.home_team_id
   GROUP BY t.team_name) tbl2
ORDER BY points DESC,
         goal_diff DESC,
         team_name