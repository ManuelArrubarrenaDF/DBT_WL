SELECT users_id,
time,
AVG(level) As avg_bat_level,
charging
FROM {{ ref('stg_battery') }}
GROUP BY charging, users_id, time
-- ORDER BY hour_day DESC