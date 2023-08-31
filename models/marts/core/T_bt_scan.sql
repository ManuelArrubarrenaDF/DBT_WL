SELECT User_id,
AVG(rssi) As avg_rssi,
device_class,
user,
mac_address,
date_t, hours, hour_min, Day_of_week
FROM {{ ref('stg_bt_scan') }}
GROUP BY date_t, hours, hour_min, Day_of_week, device_class, user, mac_address, User_id