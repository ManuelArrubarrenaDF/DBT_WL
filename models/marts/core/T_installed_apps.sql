SELECT User_id,
app,
hours, minutes, hour_min, Day_of_week
FROM {{ ref('stg_installed_apps') }}
GROUP BY hours, minutes, hour_min, Day_of_week, app, User_id