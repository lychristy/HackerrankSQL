SELECT session_id
FROM Playback
WHERE session_id not in
    (SELECT session_id
     FROM Playback pb
     LEFT JOIN Ads a ON pb.customer_id = a.customer_id
     WHERE pb.start_time <= a.timestamp
       AND a.timestamp <= pb.end_time)