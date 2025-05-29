SELECT u.id, u.name, t.seat_number
FROM tickets as t
JOIN users as u ON t.user = u.id
WHERE  t.train = 11
ORDER BY t.seat_number ASC;
