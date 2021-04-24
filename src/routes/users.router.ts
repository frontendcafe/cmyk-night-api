import { Router } from "express";
import { getUsers } from "../controllers/users.controller";

export const usersRouter = Router();

usersRouter.get("/test", (_, res) => res.status(200).send("123"));

usersRouter.get("", getUsers);
