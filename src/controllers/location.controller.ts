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

export const getLocations = catchAsync(
  async (_: Request, res: Response): Promise<Response> => {
    const response = await prisma.location.findMany({
      include: {
        address: true,
        capacity: true,
        attentionHours: {
          select: {
            day: true,
            hour: true,
          },
        },
      },
    });

    return res.status(200).json(response);
  }
);

export const getLocationById = catchAsync(
  async (req: Request, res: Response): Promise<Response> => {
    const { id } = req.params;

    const response = await prisma.location.findUnique({
      where: { id: +id },
      include: {
        address: true,
        capacity: true,
        attentionHours: {
          select: {
            day: true,
            hour: true,
          },
        },
      },
    });
    return res.status(200).json(response);
  }
);
