{%- set table_names = ['activities', 'apps_usage', 'audio', 'battery', 'bt_scan','calls','cells','display','installed_apps','location','running_apps','wifi_sacns'] -%}

{% for table_na in table_names -%}
SELECT time 
FROM {{ source('IDA_MDF_raw', '{{ table_na }}') }}

{%- if not loop.last -%}
     UNION ALL
   {% endif -%}