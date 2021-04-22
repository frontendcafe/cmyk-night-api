import { Router } from "express";
import { getEvents } from "../controllers/events.controllers";

export const eventsRouter = Router();

eventsRouter.get("/test", (_, res) => res.status(200).send("123"));

eventsRouter.get("", getEvents);

// /**
//  * Required External Modules and Interfaces
//  */
// import express, { Request, Response } from "express";
// import * as SocialEventsService from "../social-events/social-events.service";
// import { BaseSocialEvent, SocialEvent } from "../models/social-event.interface";
// /**
//  * Router Definition
//  */

// export const socialEventsRouter = express.Router();

// /**
//  * Controller Definitions
//  */

// // GET items

// socialEventsRouter.get("/", async (req: Request, res: Response) => {
//   try {
//     const items: SocialEvent[] = await SocialEventsService.findAll();
//     res.status(200).send(items);
//   } catch (e) {
//     res.status(500).send(e.message);
//   }
// });

// // GET items/:id

// socialEventsRouter.get("/:id", async (req: Request, res: Response) => {
//   const id: number = parseInt(req.params.id, 10);

//   try {
//     const item: SocialEvent = await SocialEventsService.find(id);

//     if (item) {
//       return res.status(200).send(item);
//     }

//     res.status(404).send("item not found");
//   } catch (e) {
//     res.status(500).send(e.message);
//   }
// });

// // POST items

// socialEventsRouter.post("/", async (req: Request, res: Response) => {
//   try {
//     const item: BaseSocialEvent = req.body;

//     const newItem = await SocialEventsService.create(item);

//     res.status(201).json(newItem);
//   } catch (e) {
//     res.status(500).send(e.message);
//   }
// });

// // PUT items/:id

// socialEventsRouter.put("/:id", async (req: Request, res: Response) => {
//   const id: number = parseInt(req.params.id, 10);

//   try {
//     const itemUpdate: SocialEvent = req.body;

//     const existingItem: SocialEvent = await SocialEventsService.find(id);

//     if (existingItem) {
//       const updatedItem = await SocialEventsService.update(id, itemUpdate);
//       return res.status(200).json(updatedItem);
//     }

//     const newItem = await SocialEventsService.create(itemUpdate);

//     res.status(201).json(newItem);
//   } catch (e) {
//     res.status(500).send(e.message);
//   }
// });

// // DELETE items/:id

// socialEventsRouter.delete("/:id", async (req: Request, res: Response) => {
//   try {
//     const id: number = parseInt(req.params.id, 10);
//     await SocialEventsService.remove(id);

//     res.sendStatus(204);
//   } catch (e) {
//     res.status(500).send(e.message);
//   }
// });
