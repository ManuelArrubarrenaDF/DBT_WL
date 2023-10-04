SELECT users_id,
time,
AVG(rssi) As avg_rssi,
device_class,
user,
mac_address
FROM {{ ref('stg_bt_scan') }}
GROUP BY device_class, user, mac_address, users_id, time