SELECT DISTINCT Home_Team AS H_Team,
  League, Season, 
  SUM(Home_Goals) AS H_goals,
  ROUND((SUM(HomeWins)/ COUNT(Winner)) * 100, 4) AS perc_Home_Winss,
  ROUND((SUM(DrawWins)/ COUNT(Winner)) * 100, 4) AS perc_Draw_Winss,
  ROUND((SUM(AwayWins)/ COUNT(Winner)) * 100, 4) AS perc_Away_Winss
 FROM {{ ref('stg_AllLeagues') }}
 GROUP BY 1,2,3