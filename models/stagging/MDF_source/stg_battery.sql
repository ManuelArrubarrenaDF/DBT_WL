with
source as (
    SELECT * EXCEPT (time),
    ROUND((CAST(SUBSTR(cast(time AS STRING), 6,2) AS FLOAT64)-50) / 0.416666, 2) AS hour_day

   FROM {{ source('Interview_data_analysis_MDF', 'MDF_battery') }}
)

SELECT *
FROM source