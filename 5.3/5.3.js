const express = require('express');
const mysql = require('mysql2/promise');
const app = express();
const port = 3000;

const db = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'gptjd0889@',
  database: 'kweb'
});

app.get('/fare', async (req, res) => {
  try {
    const uid = req.query.uid;
    const [userRows] = await db.query('SELECT name FROM users WHERE id = ?', [uid]);
    if (userRows.length === 0) throw new Error('User not found');

    const [fareRows] = await db.query(`
      SELECT SUM(ROUND((trains.distance / 1000) * types.fare_rate /100)*100) AS totalFare
      FROM tickets
      JOIN trains ON tickets.train = trains.id
      JOIN types ON trains.type = types.id
      WHERE tickets.user = ?
    `, [uid]);

    const total = Math.round(fareRows[0].totalFare);
    res.send(`Total fare of ${userRows[0].name} is ${total} KRW.`);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});

app.get('/train/status', async (req, res) => {
  try {
    const tid = req.query.tid;
    const [[maxRow]] = await db.query(`
      SELECT types.max_seats AS maxSeats
      FROM trains
      JOIN types ON trains.type = types.id
      WHERE trains.id = ?
    `, [tid]);
    if (!maxRow) throw new Error('Train not found');

    const [[countRow]] = await db.query(`
      SELECT COUNT(*) AS seatCount
      FROM tickets
      WHERE train = ?
    `, [tid]);

    const isSoldOut = countRow.seatCount >= maxRow.maxSeats;
    res.send(`Train ${tid} is ${isSoldOut ? 'sold out' : 'not sold out'}`);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
