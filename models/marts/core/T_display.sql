SELECT User_id,
state,
hours, minutes, hour_min, Day_of_week
FROM {{ ref('stg_display') }}
GROUP BY hours, minutes, hour_min, Day_of_week, state, User_id