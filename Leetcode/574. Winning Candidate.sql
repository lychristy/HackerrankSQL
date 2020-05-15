SELECT Name
FROM Candidate
WHERE id IN
    (SELECT top 1 CandidateId
     FROM Vote
     GROUP BY CandidateId
     ORDER BY count(*) DESC)