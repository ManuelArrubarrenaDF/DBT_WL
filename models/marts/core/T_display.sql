SELECT 
state,
hours, minutes, hour_min
FROM {{ ref('stg_display') }}
GROUP BY hours, minutes, hour_min, state