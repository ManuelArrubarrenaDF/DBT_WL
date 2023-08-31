with
source as (
    SELECT * EXCEPT (time),
    date(TIMESTAMP_MILLIS(time)) as date_t, 
    CASE 
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 11 THEN 'morning'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 11 AND EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 14 THEN 'noon'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 14 AND EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 19 THEN 'afternoon'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 19 THEN 'night'
    END AS hours,
    /*CAST(CONCAT(CAST(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) AS STRING), CAST((EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time))/1) AS STRING)) AS FLOAT64) AS hour_minute,*/
    ROUND(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) + (EXTRACT(MINUTE FROM TIMESTAMP_MILLIS(time))) / 100, 2) AS hour_min,
    TIMESTAMP_MILLIS(time) - TIMESTAMP_MILLIS(postime) AS dif_pos_time,

    CASE 
    WHEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_MILLIS(time)) >= 6 THEN 'weekend'
    ELSE 'weekday' END AS Day_of_week 

   FROM {{ source('Interview_data_analysis_MDF', 'MDF_location') }}
)

SELECT * EXCEPT(dif_pos_time, speed, acc, alt, bearing, postime),
EXTRACT(MINUTE FROM dif_pos_time) AS dif_minutes_post,
FROM source