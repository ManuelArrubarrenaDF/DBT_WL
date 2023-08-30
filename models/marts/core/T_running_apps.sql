SELECT 
* -- EXCEPT(User_id)
FROM {{ ref('stg_running_apps') }}
-- GROUP BY hours, minutes, hour_min, Cat_app,APP_clean