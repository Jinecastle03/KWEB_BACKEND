const express = require('express');
const app = express();
const port = 3000;

app.get('/factorial', (req, res) => {
  const number = req.query.number;
  res.redirect(`/factorial/${number}`);
});

function factorial(n) {
  if (n === 0 || n === 1) return 1;
  return n * factorial(n - 1);
}

app.get('/factorial/:number', (req, res) => {
  const num = req.params.number;
  const result = factorial(num);
  res.send(`${num}! = ${result}`);
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
