SELECT player_id,
       event_date,
       sum(games_played) OVER (PARTITION BY player_id
                               ORDER BY event_date) AS games_palyed_so_far
FROM Activity
ORDER BY player_id,
         event_date