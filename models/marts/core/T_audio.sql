SELECT User_id, bt_sco_connected, mic_muted, music_active, speaker_on, headset_connected, date_t, hours, hour_min, Day_of_week, ringer_mode,
AVG(alarm_volume) As avg_alarm,
AVG(music_volume) As avg_music,
AVG(notifications_volume) As avg_notif,
AVG(ring_volume) as avg_ring
FROM {{ ref('stg_audio') }}
GROUP BY 6,1,2,3,4,5,7,8,9,10,11
--ORDER BY hour_day DESC