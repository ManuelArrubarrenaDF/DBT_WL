SELECT 
*
FROM {{ ref('stg_wifi') }}
-- GROUP BY hours, minutes, hour_min, app