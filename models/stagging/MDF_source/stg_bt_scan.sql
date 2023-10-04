with
source as (
    SELECT * 

   FROM {{ source('IDA_MDF_raw', 'bt_scan') }}
)

SELECT *
FROM source
