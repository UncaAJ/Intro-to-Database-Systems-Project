SELECT p.PlayerID, p.PlayerName, p.Position, p.GamesPlayed, f.Goals
FROM PLAYERS p
JOIN STATS_FORWARD f ON p.PlayerID = f.PlayerID
WHERE p.Position = 'F'
ORDER BY f.Goals DESC
FETCH FIRST 3 ROWS ONLY;

SELECT p.PlayerID, p.PlayerName, 
       m.Assists, m.Crosses,
       CASE 
           WHEN m.Crosses = 0 THEN NULL
           ELSE m.Assists / m.Crosses
       END AS AssistToCrossRatio
FROM PLAYERS p
JOIN STATS_MIDFIELDER m ON p.PlayerID = m.PlayerID
WHERE p.Position = 'M'
ORDER BY AssistToCrossRatio DESC NULLS LAST;

SELECT p.PlayerID, p.PlayerName, d.Tackles, d.Clearances, d.CornerKicks
FROM PLAYERS p
JOIN STATS_DEFENDER d ON p.PlayerID = d.PlayerID
WHERE p.Position = 'D'
ORDER BY d.Tackles DESC, d.Clearances DESC
FETCH FIRST 5 ROWS ONLY;

SELECT p.PlayerID, p.PlayerName, p.GamesPlayed, p.Salary, 
       g.Saves, g.AllowedGoals,
       CASE 
           WHEN g.Saves = 0 THEN NULL
           ELSE g.AllowedGoals / g.Saves
       END AS GoalsAllowedPerSave
FROM PLAYERS p
JOIN STATS_GOAL g ON p.PlayerID = g.PlayerID
WHERE p.Position = 'G'
ORDER BY GoalsAllowedPerSave ASC NULLS LAST;

SELECT p.Position,
       AVG(p.Salary) AS AvgSalary,
       CASE 
           WHEN p.Position = 'F' THEN AVG(f.Goals)
           WHEN p.Position = 'M' THEN AVG(m.Assists)
           WHEN p.Position = 'D' THEN AVG(d.Tackles)
           WHEN p.Position = 'G' THEN AVG(g.Saves)
       END AS AvgKeyPerformance
FROM PLAYERS p
LEFT JOIN STATS_FORWARD f ON p.PlayerID = f.PlayerID
LEFT JOIN STATS_MIDFIELDER m ON p.PlayerID = m.PlayerID
LEFT JOIN STATS_DEFENDER d ON p.PlayerID = d.PlayerID
LEFT JOIN STATS_GOAL g ON p.PlayerID = g.PlayerID
GROUP BY p.Position
ORDER BY p.Position;

SELECT PlayerID, PlayerName, Position, GamesPlayed, GamesOnRoster
FROM PLAYERS
WHERE GamesPlayed < (
    SELECT AVG(GamesPlayed) 
    FROM PLAYERS
)
ORDER BY (GamesOnRoster - GamesPlayed) DESC, GamesPlayed ASC;

SELECT p.PlayerID, p.PlayerName, 
       m.Passes, m.Assists,
       (m.Passes + m.Assists) AS PlaymakingScore
FROM PLAYERS p
JOIN STATS_MIDFIELDER m ON p.PlayerID = m.PlayerID
WHERE p.Position = 'M'
ORDER BY PlaymakingScore DESC;

SELECT p.PlayerID, p.PlayerName, p.GamesPlayed, 
       d.Passes,
       CASE 
           WHEN p.GamesPlayed = 0 THEN NULL
           ELSE d.Passes / p.GamesPlayed
       END AS PassesPerGame
FROM PLAYERS p
JOIN STATS_DEFENDER d ON p.PlayerID = d.PlayerID
WHERE p.Position = 'D'
ORDER BY PassesPerGame DESC NULLS LAST;

SELECT p.PlayerID, p.PlayerName, p.Salary, 
       f.Goals, f.ShotsOnGoal,
       CASE 
           WHEN f.ShotsOnGoal = 0 THEN NULL
           ELSE f.Goals / f.ShotsOnGoal
       END AS ShotAccuracy
FROM PLAYERS p
JOIN STATS_FORWARD f ON p.PlayerID = f.PlayerID
WHERE p.Position = 'F'
ORDER BY ShotAccuracy DESC NULLS LAST;

SELECT p.Position,
       COUNT(p.PlayerID) AS NumPlayers,
       MAX(p.DateHired) AS MostRecentHireDate,
       CASE 
           WHEN p.Position = 'Forward' THEN AVG(f.Goals)
           WHEN p.Position = 'Midfielder' THEN AVG(m.Assists)
           WHEN p.Position = 'Defender' THEN AVG(d.Tackles)
           WHEN p.Position = 'Goalkeeper' THEN AVG(g.Saves)
       END AS AvgPerformanceMetric
FROM PLAYERS p
LEFT JOIN STATS_FORWARD f ON p.PlayerID = f.PlayerID
LEFT JOIN STATS_MIDFIELDER m ON p.PlayerID = m.PlayerID
LEFT JOIN STATS_DEFENDER d ON p.PlayerID = d.PlayerID
LEFT JOIN STATS_GOAL g ON p.PlayerID = g.PlayerID
GROUP BY p.Position
ORDER BY MostRecentHireDate DESC;