SELECT users.id, users.name, COUNT(DISTINCT tickets.train) AS trains_count, SUM(trains.distance)/10.0 AS total_distance
FROM tickets 
JOIN users ON tickets.user = users.id
JOIN trains ON tickets.train = trains.id
GROUP BY users.id, users.name
ORDER BY total_distance DESC
LIMIT 6;
