/*WITH 
  deag AS (
    SELECT COUNT (Winner) AS wins,
    Winner,
    -- COUNT (HT_Winner) AS wins_HT,
    -- HT_Winner
   FROM {{ ref('stg_AllLeagues') }}
    GROUP BY Winner -- , HT_Winner
),

 total AS (
    SELECT COUNT (Winner) AS totalF,
    --Winner
    -- COUNT (HT_Winner) AS total_HT
    FROM {{ ref('stg_AllLeagues') }}
    --GROUP BY Winner
)
*/
SELECT *,
  CASE WHEN SUM(HomeWins) = 0 THEN 0 ELSE ROUND((COUNT(Winner)/ SUM(HomeWins)) * 100, 2)  END AS perc_Home_Wins,
  CASE WHEN SUM(DrawWins) = 0 THEN 0 ELSE ROUND((COUNT(Winner)/ SUM(DrawWins)) * 100, 2)  END AS perc_Draw_Wins,
  CASE WHEN SUM(AwayWins) = 0 THEN 0 ELSE ROUND((COUNT(Winner)/ SUM(AwayWins)) * 100, 2)  END AS perc_Away_Wins
  -- Winner,
  -- wins,
 FROM {{ ref('stg_AllLeagues') }}
 GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22