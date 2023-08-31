SELECT User_id,
state,
date_t, hours, hour_min, Day_of_week
FROM {{ ref('stg_display') }}
GROUP BY date_t, hours, hour_min, Day_of_week, state, User_id