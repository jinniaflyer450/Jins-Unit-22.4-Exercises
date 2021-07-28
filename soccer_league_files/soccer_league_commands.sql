--A table including the date of the game, teams by name and scores of both teams, and the referee.
SELECT g.date, t1.name AS team1, g.team1_score AS team1_score, t2.name AS team2, g.team2_score AS team2_score, r.surname AS referee
FROM teams t1
JOIN games g ON t1.id = g.team1_id
JOIN teams t2 ON t2.id = g.team2_id
JOIN referees r ON r.id = g.referee_id;

--To get the rankings of each team in the league:
SELECT t1.name, SUM(CASE WHEN ((g.team1_score > g.team2_score AND t1.id = g.team1_id) OR 
(g.team2_score > g.team1_score AND t2.id = g.team2_id)) THEN 1 ELSE 0 END) AS wins_count 
FROM games g 
RIGHT JOIN teams t1 ON t1.id = g.team1_id 
LEFT JOIN teams t2 ON t2.id = g.team2_id
GROUP BY t1.name
ORDER BY SUM(CASE WHEN ((g.team1_score > g.team2_score AND t1.id = g.team1_id) OR 
(g.team2_score > g.team1_score AND t2.id = g.team2_id)) THEN 1 ELSE 0 END) DESC;

--Side note: So I discovered that I had to use RIGHT JOIN and LEFT JOIN where I did to keep the tie game I entered from
--messing up the wins-count/including a row with an empty team name. Any hints on solving this?