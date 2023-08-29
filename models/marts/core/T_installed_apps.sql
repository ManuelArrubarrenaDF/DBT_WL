SELECT 
app,
hours, minutes, hour_min
FROM {{ ref('stg_installed_apps') }}
GROUP BY hours, minutes, hour_min, app