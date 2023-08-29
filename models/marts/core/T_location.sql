SELECT 
*
FROM {{ ref('stg_location') }}
--GROUP BY hours, minutes, hour_min, app