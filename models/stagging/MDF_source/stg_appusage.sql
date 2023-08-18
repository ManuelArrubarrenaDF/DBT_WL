with
source as (
    SELECT User_id, total_fg_time,
   CASE 
        WHEN LOWER(package_name) LIKE '%android%' THEN 'android'
        WHEN LOWER(package_name) LIKE '%whatsapp%' THEN 'whatsapp'
        WHEN LOWER(package_name) LIKE '%mixplorer%' THEN 'mixplorer'
        WHEN LOWER(package_name) LIKE '%spotify%' THEN 'spotify'
        WHEN LOWER(package_name) LIKE '%vodafone%' THEN 'vodafone'
        WHEN LOWER(package_name) LIKE '%telegram%' THEN 'telegram'
        WHEN LOWER(package_name) LIKE '%sensapp%' THEN 'sensapp'
        WHEN LOWER(package_name) LIKE '%rsoft%' THEN 'rsoft'
        WHEN LOWER(package_name) LIKE '%argosoft%' THEN 'argosoft'
        WHEN LOWER(package_name) LIKE '%minecraftpe%' THEN 'minecraftpe'
        WHEN LOWER(package_name) LIKE '%robtopx%' THEN 'robtopx'
        WHEN LOWER(package_name) LIKE '%supercell%' THEN 'supercell'
        WHEN LOWER(package_name) LIKE '%studio8apps%' THEN 'studio8apps'
   ELSE package_name
   END AS pack_name_clean

   FROM {{ source('Interview_data_analysis_MDF', 'MDF_appusage') }}
)

SELECT *
FROM source
