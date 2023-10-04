WITH source as (
    SELECT * 

   FROM {{ source('IDA_MDF_raw', 'activities') }}
)

SELECT *
FROM source

