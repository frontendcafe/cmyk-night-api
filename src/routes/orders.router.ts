import { Router } from "express";
import {
  createOrder,
  getOrderById,
  getOrders,
} from "../controllers/orders.controller";
import { validateId } from "../middleware/validate-id.middleware";

export const ordersRouter = Router();

ordersRouter.get("/test", (_, res) => res.status(200).send("123"));

ordersRouter.get("", getOrders);
ordersRouter.get("/:id", validateId, getOrderById);
ordersRouter.post("/", createOrder);
