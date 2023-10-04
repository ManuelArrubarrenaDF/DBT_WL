SELECT users_id,
time,
app_installed_source,
FROM {{ ref('stg_installed_apps') }}
GROUP BY time, app_installed_source, users_id