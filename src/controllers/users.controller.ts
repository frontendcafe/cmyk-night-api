/**
 * Required External Modules and Interfaces
 */
import { Request, Response } from "express";
import { database } from "../database/database";
import { QueryResult } from "pg";
/**
 * Controller Definitions
 */

export const getUsers = async (
  _: Request,
  res: Response
): Promise<Response> => {
  const response = (await database
    .query("SELECT * FROM users")
    .catch((e) => res.status(500).send(e.message))) as QueryResult;
  return res
    .status(200)
    .json({ elements: response.rows, total: response.rowCount });
};

export const getUserById = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const id = parseInt(req.params.id, 10);
  const response = (await database
    .query("SELECT * FROM users WHERE id = $1", [id])
    .catch((e) => res.status(500).send(e.message))) as QueryResult;
  return res
    .status(200)
    .send({ getUserById: response.rows.length ? { ...response.rows[0] } : {} });
};

export const createUser = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const { email, name, age, created_at, updated_at } = req.body;
  (await database
    .query(
      "INSERT INTO users (email, name, age, created_at, updated_at) VALUES ($1,$2,$3,$4,$5)",
      [email, name, age, created_at, updated_at]
    )
    .catch((e) => res.status(500).send(e.message))) as QueryResult;
  return res.status(200).send({
    createUser: { email, name, age, created_at, updated_at },
    message: "User created successfuly",
  });
};

export const updateUser = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const id = parseInt(req.params.id, 10);
  const { name } = req.body;
  const response = (await database
    .query("UPDATE users SET  name = $2 WHERE id = $1", [id, name])
    .catch((e) => res.status(500).send(e.message))) as QueryResult;
  return res
    .status(200)
    .send({ message: `User ${id} has been sucessfully updated.` });
};

export const deleteUser = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const id = parseInt(req.params.id, 10);
  (await database
    .query("DELETE FROM users WHERE id = $1", [id])
    .catch((e) => res.status(500).send(e.message))) as QueryResult;
  return res
    .status(200)
    .send({ message: `User ${id} has been sucessfully deleted.` });
};
