SELECT trains.id, types.name AS type, trains.source AS src_stn, trains.destination AS dst_stn, TIMEDIFF(trains.arrival, trains.departure) AS travel_time
FROM trains
JOIN types ON trains.type = types.id
ORDER BY travel_time DESC
LIMIT 6;
