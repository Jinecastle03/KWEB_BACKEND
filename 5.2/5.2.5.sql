SELECT trains.id, types.name AS type, st_src.name AS src_stn, st_des.name AS dst_stn, COUNT(tickets.seat_number) AS occupied, types.max_seats AS maximum
FROM trains
JOIN types ON trains.type = types.id
JOIN tickets ON tickets.train = trains.id
JOIN stations AS st_src ON trains.source = st_src.id
JOIN stations AS st_des ON trains.destination = st_des.id
GROUP BY trains.id, types.name, st_src.name, st_des.name, types.max_seats
ORDER BY trains.id ASC;
