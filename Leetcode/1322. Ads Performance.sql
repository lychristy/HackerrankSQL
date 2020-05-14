SELECT ad_id,
       CASE
           WHEN sum(CASE WHEN action IN ('Clicked', 'Viewed') THEN 1 ELSE 0 END) = 0 THEN 0.00
           ELSE cast(round(sum(CASE
                                   WHEN action = 'Clicked' THEN 1
                                   ELSE 0
                               END) * 100.0 / sum(CASE
                                                      WHEN action IN ('Clicked', 'Viewed') THEN 1
                                                      ELSE 0
                                                  END), 2) AS numeric(36, 2))
       END AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC,
         ad_id
