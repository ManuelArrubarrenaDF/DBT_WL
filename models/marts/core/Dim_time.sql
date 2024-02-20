{%- set table_names = ['activities', 'apps_usage', 'audio', 'battery', 'bt_scan','calls','cells','display','installed_apps','location','running_apps','wifi_scans'] -%}

{% for table_ in table_names -%}
    SELECT 
    time as time_id,
    date(TIMESTAMP_MILLIS(time)) as date_time, 
    CASE 
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 11 THEN 'morning'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 11 AND EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 14 THEN 'noon'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 14 AND EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 19 THEN 'afternoon'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 19 THEN 'night'
    END AS period_day,
    EXTRACT(MINUTE FROM TIMESTAMP_MILLIS(time)) AS minutes,
    --CAST(CONCAT(CAST(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) AS STRING), CAST((EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time))/1) AS STRING)) AS FLOAT64) AS hour_minute,
    ROUND(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) + (EXTRACT(MINUTE FROM TIMESTAMP_MILLIS(time))) / 100 , 2) AS hour_min,
    CASE 
    WHEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_MILLIS(time)) >= 6 THEN 'weekend'
    ELSE 'weekday' END AS Day_of_week  
    FROM {{ source('IDA_MDF_raw', table_) }}
{% if not loop.last -%}
     UNION ALL
   {% endif -%}

{%- endfor %}

--- dbtu_LqTDXlgyG0RPSa2ZyvixBmpF6fkPFPBLci63HZXcx3_WE_BO2Y