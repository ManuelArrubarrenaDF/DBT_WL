with
source as (
    SELECT * 

   FROM {{ source('IDA_MDF_raw', 'location') }}
)

SELECT * EXCEPT(speed, acc, alt, bearing, postime)
FROM source
