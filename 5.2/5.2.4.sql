SELECT types.name AS type, st_src.name AS src_stn, st_des.name AS dst_stn, trains.departure, trains.arrival, ROUND((trains.distance / 1000) * types.fare_rate/100)*100 AS fare
FROM trains
JOIN types ON trains.type = types.id
JOIN stations AS st_src ON trains.source = st_src.id
JOIN stations AS st_des ON trains.destination = st_des.id
ORDER BY trains.departure ASC;
