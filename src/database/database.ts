import { Pool } from "pg";
export const database = new Pool({
  user: "admin",
  password: "admin",
  host: "localhost",
  database: "api",
});
