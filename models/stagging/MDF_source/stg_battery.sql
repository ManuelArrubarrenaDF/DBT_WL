with
source as (
    SELECT * 

   FROM {{ source('IDA_MDF_raw', 'battery') }}
)

SELECT *
FROM source
