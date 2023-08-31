SELECT User_id,
app_clean_installed, app_installed_source,
date_t, hours, hour_min, Day_of_week
FROM {{ ref('stg_installed_apps') }}
GROUP BY date_t, hours, hour_min, Day_of_week, app_clean_installed, app_installed_source, User_id