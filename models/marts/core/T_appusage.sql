SELECT User_id, SUM (total_fg_time) AS time_in_app, pack_name_clean, hours, minutes, hour_min
FROM {{ ref('stg_appusage') }}
GROUP BY  pack_name_clean, User_id, hours, minutes, hour_min
ORDER BY time_in_app DESC