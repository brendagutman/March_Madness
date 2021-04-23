## March 2021 Data Visualization Challenge: March Madness

For this month's challenge, you have been given a database containing information about all regular season and NCAA Tournament games going back to 1985 for men's teams and 1998 for women's teams. This data is split out into a number of tables (see the included ERD).

For detailed information on the variables contained in each table, see https://www.kaggle.com/c/ncaaw-march-mania-2021/data and https://www.kaggle.com/c/ncaam-march-mania-2021/data. You will need to sign up for a Kaggle account to view this information.

Each team is identified by their teamid value. **Warning:** the men's and women's teams for a given school will have a different teamid. For example, Belmont University's men's team has teamid 1125; whereas the women's team has teamid 3125. 

Data on each game is included in the `*regularseasoncompactresults` and `*ncaatourneycompactresults`. Teams are identified as either the winning team (wteamid) or the losing team (lteamid). 

For example, the 2008 women's NCAA championship game appears in the table `wncaatourneycompactresults` as
season|daynum|wteamid|wscore|lteamid|lscore|wloc|numot|
------|------|-------|------|-------|------|----|-----|
  2008|   155|   3397|    64|   3390|    48|N   |    0|

The winning team (teamid 3397) was Tennessee, with a score of 64, and the losing team (teamid 3390) was Stanford, with a score of 48. The `wloc` column indicates that the game was played on a neutral court.

If you want to include information about the seed of each team, you will need to pull that from the `*ncaatourneyseeds` tables. Seeds are listed by region and then by seed. For example, in 2019, the Tennessee men's team's seed was "Z02", meaning that they were the number 2 seed in the "Z" region (the South region). This appears in the `mncaatourneyseeds` table as
season|seed|teamid|
------|----|------|
  2019|Z02 |  1397|

Play-in teams will have an a or b after their seed number. For example, in 2014, the Tennessee men's team was a play-in team and their seed is listed as "Y11b", meaning that they were an 11 seed, but that they were in a play-in game. 
season|seed|teamid|
------|----|------|
  2014|Y11b|  1397|

**Recommendation:** Do not try to create a visualization showing the whole history of NCAA basketball. Instead, decide on a single specific question that you would like to investigate and see what you can find in the data related to that question.