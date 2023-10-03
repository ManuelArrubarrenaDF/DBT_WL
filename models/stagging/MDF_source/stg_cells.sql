with
source as (
    SELECT * 

   FROM {{ source('IDA_MDF_raw', 'cells') }}
)

SELECT *
FROM source
