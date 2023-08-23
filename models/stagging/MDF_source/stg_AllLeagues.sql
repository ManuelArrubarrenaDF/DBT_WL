with
source as (
    SELECT * 
   FROM {{ source('Interview_data_analysis', 'AllLeagues') }}
)

SELECT *
FROM source