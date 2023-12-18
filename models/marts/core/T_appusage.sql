SELECT 
SUM (total_fg_time) AS time_in_app, 
users_id,
time,
pack_name_root
FROM {{ ref('stg_appusage') }}
GROUP BY users_id, time, pack_name_root
-------