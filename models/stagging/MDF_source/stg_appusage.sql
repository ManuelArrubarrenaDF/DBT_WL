with
source as (
    SELECT User_id, 
    total_fg_time, 
    date(TIMESTAMP_MILLIS(time)) as date_t, 
    CASE 
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 11 THEN 'morning'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 11 AND EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 14 THEN 'noon'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 14 AND EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) <= 19 THEN 'afternoon'
    WHEN EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) > 19 THEN 'night'
    END AS hours,
    /*CAST(CONCAT(CAST(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) AS STRING), CAST((EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time))/1) AS STRING)) AS FLOAT64) AS hour_minute,*/
    ROUND(EXTRACT(HOUR FROM TIMESTAMP_MILLIS(time)) + (EXTRACT(MINUTE FROM TIMESTAMP_MILLIS(time))) / 100, 2) AS hour_min,

    CASE WHEN package_name LIKE 'com.%' THEN SUBSTRING(package_name,5,LENGTH(package_name))
    WHEN package_name LIKE 'it.cnr%' THEN SUBSTRING(package_name,12,LENGTH(package_name))
    WHEN package_name LIKE 'it.%' THEN SUBSTRING(package_name,4,LENGTH(app))
    ELSE package_name
    END AS pack_name_clean,
    
   CASE 
        WHEN LOWER(package_name) LIKE 'android' THEN 'android'
        WHEN LOWER(package_name) LIKE 'com.android%' THEN 'android'
        WHEN LOWER(package_name) LIKE 'com.sec.android%' THEN 'android'
        WHEN LOWER(package_name) LIKE 'com.samsung.android%' THEN 'android'
        WHEN LOWER(package_name) LIKE '%twitter%' THEN 'twitter'
        WHEN LOWER(package_name) LIKE '%whatsapp%' THEN 'whatsapp'
        WHEN LOWER(package_name) LIKE '%mixplorer%' THEN 'mixplorer'
        WHEN LOWER(package_name) LIKE '%spotify%' THEN 'spotify'
        WHEN LOWER(package_name) LIKE '%vodafone%' THEN 'vodafone'
        WHEN LOWER(package_name) LIKE '%telegram%' THEN 'telegram'
        WHEN LOWER(package_name) LIKE '%sensapp%' THEN 'sensapp'
        WHEN LOWER(package_name) LIKE '%rsoft%' THEN 'rsoft'
        WHEN LOWER(package_name) LIKE '%argosoft%' THEN 'argosoft'
        WHEN LOWER(package_name) LIKE '%minecraftpe%' THEN 'minecraftpe'
        WHEN LOWER(package_name) LIKE '%robtopx%' THEN 'robtopx'
        WHEN LOWER(package_name) LIKE '%supercell%' THEN 'supercell'
        WHEN LOWER(package_name) LIKE '%studio8apps%' THEN 'studio8apps'
        WHEN LOWER(package_name) LIKE '%samsung%' AND LOWER(app) NOT LIKE '%samsung.android%' THEN 'samsung'
        WHEN LOWER(package_name) LIKE '%facebook%' THEN 'facebook'
        -- REVISAR CUANDO SEA APPLE--
   ELSE 'other' 
   END AS pack_name_root,

    CASE 
    WHEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_MILLIS(time)) >= 6 THEN 'weekend'
    ELSE 'weekday' END AS Day_of_week 

   FROM {{ source('Interview_data_analysis_MDF', 'MDF_appusage') }}
)

SELECT *
FROM source
