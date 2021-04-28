/**
 * Required External Modules and Interfaces
 */
import { Request, Response } from "express";

import { PrismaClient } from "@prisma/client";
import { catchAsync } from "../common/catch-async";

const prisma = new PrismaClient();

/**
 * Controller Definitions
 */

export const getEvents = catchAsync(
  async (_: Request, res: Response): Promise<Response> => {
    const response = await prisma.socialEvents.findMany({
      include: {
        performer: true,
        socialEventSchedule: true,
      },
    });

    return res.status(200).json(response);
  }
);

export const getEventById = catchAsync(
  async (req: Request, res: Response): Promise<Response> => {
    const { id } = req.params;

    const response = await prisma.socialEvents.findUnique({
      where: { id: +id },
      include: {
        performer: true,
        socialEventSchedule: {
          include: {
            schedule: true,
          },
        },
      },
    });
    return res.status(200).json(response);
  }
);
