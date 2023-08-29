SELECT 
AVG(rssi) As avg_rssi,
device_class,
user,
mac_address,
hours, minutes, hour_min
FROM {{ ref('stg_bt_scan') }}
GROUP BY hours, minutes, hour_min, device_class, user, mac_address