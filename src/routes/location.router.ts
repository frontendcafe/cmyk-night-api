import { Router } from "express";
import {
  getLocationById,
  getLocations,
} from "../controllers/location.controller";
import { validateId } from "../middleware/validate-id.middleware";

export const locationRouter = Router();

locationRouter.get("/test", (_, res) => res.status(200).send("123"));

locationRouter.get("", getLocations);
locationRouter.get("/:id", validateId, getLocationById);
