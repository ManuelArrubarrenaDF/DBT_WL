with
source as (
    SELECT * 
   FROM {{ source('IDA_MDF_raw', 'audio') }}
)

SELECT *
FROM source
