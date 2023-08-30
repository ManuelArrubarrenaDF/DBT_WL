SELECT User_id, SUM (total_fg_time) AS time_in_app, 
pack_name_clean, hours, minutes, hour_min, Day_of_week
FROM {{ ref('stg_appusage') }}
GROUP BY  pack_name_clean, User_id, hours, minutes, hour_min, Day_of_week
ORDER BY time_in_app DESC