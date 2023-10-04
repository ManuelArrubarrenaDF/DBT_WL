with
source as (
    SELECT * 

   FROM {{ source('IDA_MDF_raw', 'calls') }}
)

SELECT *
FROM source
