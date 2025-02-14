const express = require('express');
const pg = require('pg');

const pool = new pg.Pool({
  host: 'localhost',
  port: 5432,
  database: 'socialnetwork',
  user: 'anishkumardubey',
  password: '',
});

// testing if pool connection is established
//pool.query('SELECT 1 + 1;').then((results) => console.log('Results:', results));

const app = express();

//I'm going to wire up one middleware to use with the express application. That is going to allow us to receive form submissions from a browser.
app.use(express.urlencoded({ extended: true }));

app.get('/posts', async (req, res) => {
  const { rows } = await pool.query(`
    SELECT * FROM posts;
  `);

  res.send(`
    <table>
      <thead>
        <tr>
          <th>id</th>
          <th>lng</th>
          <th>lat</th>
        </tr>
      </thead>
      <tbody>
        ${rows
          .map((row) => {
            return `
            <tr>
              <td>${row.id}</td>
              <td>${row.loc.x}</td>
              <td>${row.loc.y}</td>
            </tr>
          `;
          })
          .join('')}
      </tbody>
    </table>
    <form method="POST">
      <h3>Create Post</h3>
      <div>
        <label>Lng</label>
        <input name="lng" />
      </div>
      <div>
        <label>Lat</label>
        <input name="lat" />
      </div>
      <button type="submit">Create</button>
    </form>
  `);
});

app.post('/posts', async (req, res) => {
  const { lng, lat } = req.body;

  // await pool.query('INSERT INTO posts (lat, lng, loc) VALUES ($1, $2, $3);', [lat, lng, `(${lat},${lng})`]);

  await pool.query('INSERT INTO posts (loc) VALUES ($1);', [`(${lat},${lng})`]);

  res.redirect('/posts');
});

app.listen(3005, () => {
  console.log('Listening on port 3005');
});

