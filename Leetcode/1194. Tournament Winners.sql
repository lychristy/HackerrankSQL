SELECT group_id AS GROUP_ID,
       player_id AS PLAYER_ID
FROM
  (SELECT *,
          row_number() OVER (PARTITION BY group_id ORDER BY total_score DESC, player_id) AS rn
   FROM
     (SELECT p.group_id,
             p.player_id,
             sum(CASE
                     WHEN p.player_id = m.first_player THEN first_score
                     WHEN p.player_id = m.second_player THEN second_score
                     ELSE 0
                 END) AS total_score
      FROM Players p
      LEFT JOIN Matches m ON p.player_id = m.first_player
      OR p.player_id = m.second_player
      GROUP BY p.group_id,
               p.player_id) t1) t2
WHERE rn =1
ORDER BY group_id