SELECT User_id, 
SUM (in_vehicle) as sum_vehicle,
SUM(on_bicycle) as sum_bicicle,
SUM(on_foot) as sum_foot,
SUM(running)as sum_running,
SUM(still)as sum_still,
SUM(tilting) as sum_tilting,
SUM(walking) as sum_walking,
SUM(unknown) as sum_unknown,
hours, minutes, hour_min
FROM {{ ref('stg_activities') }}
GROUP BY hours, minutes, hour_min, User_id
--ORDER BY hour_day DESC