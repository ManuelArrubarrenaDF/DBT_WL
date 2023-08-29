with
source as (
    SELECT * EXCEPT (time),
    --    SELECT TIMESTAMP_MILLIS(time) as hrs, 
    EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) AS hours,
    EXTRACT(MINUTE FROM TIMESTAMP_MILLIS(time)) AS minutes,
    /*CAST(CONCAT(CAST(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) AS STRING), CAST((EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time))/1) AS STRING)) AS FLOAT64) AS hour_minute,*/
    ROUND(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) + (EXTRACT(MINUTE FROM TIMESTAMP_MILLIS(time))) / 100, 2) AS hour_min,
    TIMESTAMP_MILLIS(time) - TIMESTAMP_MILLIS(postime) AS dif_pos_time

   FROM {{ source('Interview_data_analysis_MDF', 'MDF_location') }}
)

SELECT * EXCEPT(dif_pos_time, speed, acc, alt, bearing, postime),
EXTRACT(MINUTE FROM dif_pos_time) AS dif_minutes_post,
FROM source