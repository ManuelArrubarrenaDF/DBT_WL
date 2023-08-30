SELECT User_id,
AVG(singal) As avg_signal,
type,
hours, minutes, hour_min, Day_of_week
FROM {{ ref('stg_cells') }}
GROUP BY hours, minutes, hour_min, Day_of_week, type, User_id