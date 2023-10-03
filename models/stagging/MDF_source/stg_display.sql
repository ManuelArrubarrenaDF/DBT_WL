with
source as (
    SELECT * 

   FROM {{ source('IDA_MDF_raw', 'display') }}
)

SELECT *
FROM source
