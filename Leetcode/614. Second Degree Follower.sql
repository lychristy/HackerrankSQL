SELECT f1.follower,
       count(DISTINCT f2.follower) AS num
FROM follow f1,
     follow f2
WHERE f1.follower = f2.followee
GROUP BY f1.follower
ORDER BY f1.follower