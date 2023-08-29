SELECT 
AVG(level) As avg_bat_level,
charging,
hours, minutes, hour_min
FROM {{ ref('stg_battery') }}
GROUP BY hours, minutes, hour_min, charging
-- ORDER BY hour_day DESC