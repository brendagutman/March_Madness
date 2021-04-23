/*
Do they win at home or away most often? broken down by region and gender?
Home advantage/ fan base
percent wins per season for each team - women
Is it still a thing - over time
*/


/* Main - teamid and wins
    Sub - teamid and wins per location */
WITH wins_home AS(
SELECT  teamid, season, SUM(count) AS total_won_home
FROM   (SELECT wteamid AS teamid, wloc, season,
		COUNT(wteamid)
		FROM wregularseasoncompactresults AS wrscr 
		WHERE wloc ILIKE 'H'
		GROUP BY wteamid, wloc, season
		ORDER BY wteamid) AS wins_per_loc
GROUP BY teamid,season
ORDER BY teamid, season 
),
     total AS(
SELECT  DISTINCT(wteamid) AS teamid, season, COUNT(*) AS total_games
FROM   wregularseasoncompactresults AS wrscr
GROUP BY teamid, season
ORDER BY teamid, season 
 )
SELECT wt.teamid, 
		teamname, 
		total.season,
	    total_won_home, 
		total_games,
	    ROUND((total_won_home * 100.0)/(total_games),2) AS percent_won
FROM total
JOIN wins_home ON total.teamid = wins_home.teamid
JOIN wteams AS wt ON wt.teamid = total.teamid
GROUP BY wt.teamid, teamname, total_won_home, total.season, total_games
ORDER BY wt.teamid, season
	
	
	
	