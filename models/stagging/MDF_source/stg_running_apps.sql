with
source as (
    SELECT * EXCEPT (time, category, app),
    --    SELECT TIMESTAMP_MILLIS(time) as hrs, 
    EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) AS hours,
    EXTRACT(MINUTE FROM TIMESTAMP_MILLIS(time)) AS minutes,
    /*CAST(CONCAT(CAST(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) AS STRING), CAST((EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time))/1) AS STRING)) AS FLOAT64) AS hour_minute,*/
    ROUND(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) + (EXTRACT(MINUTE FROM TIMESTAMP_MILLIS(time))) / 100, 2) AS hour_min,

    CASE WHEN category IS NULL THEN "N/A"
    ELSE category 
    END as Cat_app,

    CASE WHEN app LIKE 'com.%' THEN SUBSTRING(app,5,LENGTH(app))
    WHEN app LIKE 'it.cnr%' THEN SUBSTRING(app,12,LENGTH(app))
    ELSE app
    END AS APP_clean,

    CASE 
    WHEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_MILLIS(time)) >= 6 THEN 'weekend'
    ELSE 'weekday' END AS Day_of_week 

   FROM {{ source('Interview_data_analysis_MDF', 'MDF_running_apps') }}
)

SELECT *
FROM source