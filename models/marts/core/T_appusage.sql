SELECT User_id, SUM (total_fg_time) AS time_in_app, 
pack_name_clean, pack_name_root, date_t, hours, hour_min, Day_of_week
FROM {{ ref('stg_appusage') }}
GROUP BY  pack_name_clean, pack_name_root, User_id, hours, date_t, hour_min, Day_of_week
ORDER BY time_in_app DESC