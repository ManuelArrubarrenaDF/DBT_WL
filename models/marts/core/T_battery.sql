SELECT 
AVG(level) As avg_level,
charging,
hour_day
FROM {{ ref('stg_battery') }}
GROUP BY hour_day, charging
ORDER BY hour_day DESC