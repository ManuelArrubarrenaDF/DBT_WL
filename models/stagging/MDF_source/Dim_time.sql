{%- set table_names = ['activities', 'apps_usage', 'audio', 'battery', 'bt_scan','calls','cells','display','installed_apps','location','running_apps','wifi_sacns'] -%}

{% for table_names in table_names -%}
    SELECT time 
    FROM {{ source('IDA_MDF_raw', '{{table_na}}') }}
    --FROM `data-eng-training-87b25bc6.IDA_MDF_raw.{{table_names}}`
{%- if not loop.last -%}
     UNION ALL
   {% endif -%}

{%- endfor %}

--FROM {{ source('Interview_data_analysis_MDF', 'MDF_activities') }}