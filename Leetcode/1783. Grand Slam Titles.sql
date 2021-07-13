SELECT tbl1.player_id,
       p.player_name,
       count(*) AS grand_slams_count
FROM
  (SELECT Wimbledon AS player_id FROM Championships
   UNION ALL 
   SELECT Fr_open AS player_id FROM Championships
   UNION ALL 
   SELECT US_open AS player_id FROM Championships
   UNION ALL 
   SELECT Au_open AS player_id FROM Championships) tbl1
LEFT JOIN Players p ON p.player_id = tbl1.player_id
GROUP BY tbl1.player_id,
         p.player_name