const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));

const stringObj = (obj) => Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n');

app.get('/', (req, res) => {
  const queryData = req.query;
  res.send(stringObj(queryData));
});

app.post('/', (req, res) => {
  const bodyData = req.body;
  res.send(stringObj(bodyData));
});

app.put('/', (req, res) => {
  const bodyData = req.body;
  res.send(stringObj(bodyData));
});

app.delete('/', (req, res) => {
  const bodyData = req.body;
  res.send(stringObj(bodyData));
});

app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
