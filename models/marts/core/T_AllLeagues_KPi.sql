/*
WITH
percentages AS(
SELECT
  COUNT(Winner) AS c_winner,
  SUM(HomeWins) AS sumH,
  SUM(DrawWins) As sumD ,
  SUM(AwayWins) AS sumA,
  ROUND((SUM(HomeWins)/ COUNT(Winner)) * 100, 4) AS perc_Home_Winss,
  ROUND((SUM(DrawWins)/ COUNT(Winner)) * 100, 4) AS perc_Draw_Winss,
  ROUND((SUM(AwayWins)/ COUNT(Winner)) * 100, 4) AS perc_Away_Winss
  -- Winner,
  -- wins,
 FROM `data-eng-training-87b25bc6.MDF_gold.stg_AllLeagues` 
),

perc2 AS(
SELECT ID_all,
  CASE WHEN a.HomeWins = 0 THEN 0 ELSE ROUND((perc_Home_Winss / sumH) * 100, 5) END AS perc_Home_Wins,
  CASE WHEN a.DrawWins = 0 THEN 0 ELSE ROUND((perc_Draw_Winss / sumD) * 100, 5) END AS perc_Draw_Wins,
  CASE WHEN a.AwayWins = 0 THEN 0 ELSE ROUND((perc_Away_Winss / sumA) * 100, 5) END AS perc_Away_Wins
  FROM `data-eng-training-87b25bc6.MDF_gold.stg_AllLeagues` AS a , percentages
--ORDER BY Perc_good DESC
)

SELECT *  
FROM `data-eng-training-87b25bc6.MDF_gold.stg_AllLeagues`
JOIN perc2 USING (ID_all)
*/
SELECT *,
  ROUND((SUM(HomeWins)/ COUNT(Winner)) * 100, 4) AS perc_Home_Winss,
  ROUND((SUM(DrawWins)/ COUNT(Winner)) * 100, 4) AS perc_Draw_Winss,
  ROUND((SUM(AwayWins)/ COUNT(Winner)) * 100, 4) AS perc_Away_Winss
 FROM `data-eng-training-87b25bc6.MDF_gold.stg_AllLeagues`
 GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23