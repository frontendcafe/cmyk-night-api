/**
 * Required External Modules
 */

import { config } from "dotenv";
import express from "express";
import cors from "cors";
import helmet from "helmet";
import { notFoundHandler } from "./middleware/not-found.middleware";
import { errorHandler } from "./middleware/error.middleware";
import { indexRouter } from "./routes/index.router";
config({ encoding: "utf-8" });

/**
 * App Variables
 */

if (!process.env.PORT) {
  process.exit(1);
}

const PORT: number = parseInt(process.env.PORT as string, 10);

const app = express();

/**
 *  App Configuration
 */

app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

/**
 *  App routes
 */
app.use("/api/", indexRouter);
app.get("/", (req, res) => res.send("Express + TypeScript Server"));

app.use(errorHandler);
app.use(notFoundHandler);

/**
 * Server Activation
 */

app.listen(PORT, () => {
  console.log(`Listening on port http://localhost:${PORT}`);
});
