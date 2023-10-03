with
source as (
    SELECT * EXCEPT (bssid, dbm_level, configured, connected, user_device)

   FROM {{ source('IDA_MDF_raw', 'wifi_scans') }}

   WHERE CAST(connected AS STRING) != 'false'
)

SELECT *
FROM source
