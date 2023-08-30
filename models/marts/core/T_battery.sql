SELECT User_id,
AVG(level) As avg_bat_level,
charging,
hours, minutes, hour_min, Day_of_week
FROM {{ ref('stg_battery') }}
GROUP BY hours, minutes, hour_min, Day_of_week, charging, User_id
-- ORDER BY hour_day DESC