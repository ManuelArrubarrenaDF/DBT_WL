SELECT users_id,
time,
state
FROM {{ ref('stg_display') }}
GROUP BY state, users_id, time 