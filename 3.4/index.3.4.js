const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  res.send(`
    <form method="post" action="/login">
      <div>
        <label>Username:</label>
        <input name="username" type="text" />
      </div>
      <div>
        <label>Password:</label>
        <input name="password" type="password" />
      </div>
      <button type="submit">Login</button>
    </form>
  `);
});

app.post('/login', (req, res) => {
  const { username, password } = req.body;
  res.send(`username: ${username}, password: ${password}`);
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
