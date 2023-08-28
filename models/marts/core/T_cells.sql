SELECT 
AVG(singal) As avg_signal,
type,
hours, minutes, hour_min
FROM {{ ref('stg_cells') }}
GROUP BY hours, minutes, hour_min, type