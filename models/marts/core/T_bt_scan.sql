SELECT User_id,
AVG(rssi) As avg_rssi,
device_class,
user,
mac_address,
hours, minutes, hour_min, Day_of_week
FROM {{ ref('stg_bt_scan') }}
GROUP BY hours, minutes, hour_min, Day_of_week, device_class, user, mac_address, User_id