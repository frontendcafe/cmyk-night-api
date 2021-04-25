import { Router } from "express";
import { getEventById, getEvents } from "../controllers/events.controllers";

export const eventsRouter = Router();

eventsRouter.get("/test", (_, res) => res.status(200).send("123"));

eventsRouter.get("", getEvents);
eventsRouter.get("/:id", getEventById);
