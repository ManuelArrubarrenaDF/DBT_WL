with
source as (
    SELECT * EXCEPT (time, bssid, dbm_level, configured, connected, user_device),
    date(TIMESTAMP_MILLIS(time)) as date_t, 
    CASE 
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 11 THEN 'morning'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 11 AND EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 14 THEN 'noon'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 14 AND EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 19 THEN 'afternoon'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 19 THEN 'night'
    END AS hours,
    /*CAST(CONCAT(CAST(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) AS STRING), CAST((EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time))/1) AS STRING)) AS FLOAT64) AS hour_minute,*/
    ROUND(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) + (EXTRACT(MINUTE FROM TIMESTAMP_MILLIS(time))) / 100, 2) AS hour_min,

    CASE 
    WHEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_MILLIS(time)) >= 6 THEN 'weekend'
    ELSE 'weekday' END AS Day_of_week 

   FROM {{ source('Interview_data_analysis_MDF', 'MDF_wifi_scans') }}

   WHERE CAST(connected AS STRING) != 'false'
)

SELECT *
FROM source