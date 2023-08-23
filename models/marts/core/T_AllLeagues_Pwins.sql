WITH 
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
    -- COUNT (HT_Winner) AS total_HT
    FROM {{ ref('stg_AllLeagues') }}
)

SELECT 
  ROUND((wins / totalF) * 100, 2) AS perc_wins,
  --ROUND((wins_HT / total_HT) * 100, 2) AS perc_HT,
  Winner,
  wins,
  --HT_Winner,
  --wins_HT
  FROM total, deag