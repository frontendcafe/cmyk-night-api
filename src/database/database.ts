import { Client } from "pg";
export const client = new Client({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false,
  },
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: +(process.env.DB_PORT ?? 5432),
});

client.connect();

// client.query(
//   "SELECT table_schema,table_name FROM information_schema.tables;",
//   (err, res) => {
//     if (err) throw err;
//     for (let row of res.rows) {
//       console.log(JSON.stringify(row));
//     }
//     client.end();
//   }
// );
// client
//   .query("SELECT * FROM table")
//   .then((response) => {
//     console.log(response.rows);
//     client.end();
//   })
//   .catch((err) => {
//     client.end();
//   });
