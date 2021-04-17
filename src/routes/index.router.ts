import { Router } from "express";
import { usersRouter } from "./users.router";

export const indexRouter = Router();

indexRouter.get("/test", (_, res) => res.status(200).send("123"));

indexRouter.use("/users/", usersRouter);
