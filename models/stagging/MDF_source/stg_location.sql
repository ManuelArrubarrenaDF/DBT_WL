with
source as (
    SELECT * 

   FROM {{ source('IDA_MDF_raw', 'location') }}
)

SELECT * EXCEPT(dif_pos_time, speed, acc, alt, bearing, postime),
EXTRACT(MINUTE FROM dif_pos_time) AS dif_minutes_post,
FROM source
