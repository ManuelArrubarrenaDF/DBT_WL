SELECT users_id,
time,
AVG(singal) As avg_signal,
type
FROM {{ ref('stg_cells') }}
GROUP BY type, users_id, time 