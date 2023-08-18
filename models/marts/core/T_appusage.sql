SELECT User_id, SUM (total_fg_time) AS time_in_app, pack_name_clean, hour_day
FROM {{ ref('stg_appusage') }}
GROUP BY  pack_name_clean, User_id, hour_day
ORDER BY time_in_app DESC