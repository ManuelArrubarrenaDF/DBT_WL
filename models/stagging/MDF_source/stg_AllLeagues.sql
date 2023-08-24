with
source as (
    SELECT *, 
        CASE 
            WHEN Winner = 'A' THEN 1 ELSE 0 END AS AwayWins,
        CASE  
            WHEN Winner = 'D' THEN 1 ELSE 0 END AS DrawWins,
        CASE
            WHEN Winner = 'H' THEN 1 ELSE 0 END AS HomeWins
   FROM {{ source('Interview_data_analysis', 'AllLeagues') }}
)

SELECT *
FROM source