SELECT bt_sco_connected, mic_muted, music_active, speaker_on, headset_connected, hour_day, ringer_mode,
AVG(alarm_volume) As avg_alarm,
AVG(music_volume) As avg_music,
AVG(notifications_volume) As avg_notif,
AVG(ring_volume) as avg_ring
FROM {{ ref('stg_audio') }}
GROUP BY 6,1,2,3,4,5,7
ORDER BY hour_day DESC