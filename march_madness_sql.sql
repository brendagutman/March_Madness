/*
Do they win at home or away most often? broken down by region and gender?
*/

--Home advantage/ fan base

--percent wins per season for each team - women

/* Main - teamid and wins
    Sub - teamid and wins per location */
WITH wins AS(
SELECT  teamid, SUM(count) AS total_won
FROM   (SELECT wteamid AS teamid, wloc,
		COUNT(wteamid)
		FROM wregularseasoncompactresults AS wrscr 
		GROUP BY wteamid, wloc
		ORDER BY wteamid) AS wins_per_loc
GROUP BY teamid
),
/* Main - teamid and loss
    Sub - teamid and loss per location */
	loss AS(
SELECT teamid , SUM(count) AS total_lost
FROM   (SELECT lteamid AS teamid, 
		CASE WHEN wloc = 'H' THEN 'A'
			 WHEN wloc = 'A' THEN 'H'
			 ELSE wloc END AS lloc,
		COUNT(wteamid)
		FROM wregularseasoncompactresults AS wrscr 
		GROUP BY lteamid, wloc
		ORDER BY lteamid) AS wins_per_loc
GROUP BY teamid
)
/*  Find total games
	Main - SUM games per teamid
    Sub - teamid and loss per location */
SELECT wins.teamid, teamname,
	   SUM(total_won + total_lost)	AS wtotal_games_per_team
FROM wins
JOIN loss ON wins.teamid = loss.teamid
JOIN wteams ON wteams.teamid = wins.teamid
GROUP BY wins.teamid, teamname
	
	
	
	