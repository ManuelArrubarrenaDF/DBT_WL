SELECT User_id,
AVG(singal) As avg_signal,
type,
date_t, hours, hour_min, Day_of_week
FROM {{ ref('stg_cells') }}
GROUP BY date_t, hours, hour_min, Day_of_week, type, User_id