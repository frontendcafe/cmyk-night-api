import { Router } from "express";
import {
  getUsers,
  getUserById,
  createUser,
  updateUser,
  deleteUser,
} from "../controllers/users.controller";

export const usersRouter = Router();

usersRouter.get("/test", (_, res) => res.status(200).send("123"));

usersRouter.get("", getUsers);
usersRouter.get("/:id", getUserById);
usersRouter.post("", createUser);
usersRouter.patch("/:id", updateUser);
usersRouter.delete("/:id", deleteUser);
