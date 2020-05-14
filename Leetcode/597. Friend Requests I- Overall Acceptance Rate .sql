SELECT CASE
           WHEN
                  (SELECT count(*)
                   FROM
                     (SELECT DISTINCT sender_id,
                                      send_to_id
                      FROM friend_request) t2) = 0 THEN 0
           ELSE cast(round(
                             (SELECT count(*)
                              FROM
                                (SELECT DISTINCT requester_id, accepter_id
                                 FROM request_accepted) t1) * 1.0 /
                             (SELECT count(*)
                              FROM
                                (SELECT DISTINCT sender_id, send_to_id
                                 FROM friend_request) t2), 2) AS numeric(36, 2))
       END AS accept_rate