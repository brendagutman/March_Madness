--winning team separated by city and state
SELECT DISTINCT(teamid), state, SUM(number) OVER(PARTITION BY state)
FROM(
	SELECT (wteamid) AS teamid, state, ct.city,COUNT(wgc.cityid) AS number
	FROM wgamecities AS wgc
	LEFT JOIN cities AS ct ON wgc.cityid = ct.cityid
	GROUP BY wteamid, ct.city, state
	ORDER BY wteamid
	) AS sub
ORDER BY teamid 
--losing team separated by city and state
SELECT DISTINCT(teamid), state, SUM(number) OVER(PARTITION BY state)
FROM(
	SELECT (lteamid) AS teamid, state, ct.city,COUNT(wgc.cityid) AS number
	FROM wgamecities AS wgc
	LEFT JOIN cities AS ct ON wgc.cityid = ct.cityid
	GROUP BY lteamid, ct.city, state
	ORDER BY lteamid
	) AS sub
ORDER BY teamid 