SELECT User_id,
AVG(level) As avg_bat_level,
charging,
date_t, hours, hour_min, Day_of_week
FROM {{ ref('stg_battery') }}
GROUP BY date_t, hours, hour_min, Day_of_week, charging, User_id
-- ORDER BY hour_day DESC