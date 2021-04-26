/**
 * Required External Modules and Interfaces
 */
import { NextFunction, Request, Response } from "express";

import { PrismaClient } from "@prisma/client";
import { catchAsync } from "../common/catch-async";
import { ApiError } from "../common/api-error";

const prisma = new PrismaClient();

/**
 * Controller Definitions
 */

export const getOrders = catchAsync(
  async (
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<Response> => {
    const { userId } = req.body;

    if (!userId || !+userId) {
      next(
        ApiError.badRequest(
          `Invalid ID, expected to be number but received: ${userId} of type ${typeof userId}`
        )
      );
    }
    const response = await prisma.orders.findMany({
      where: {
        userId,
      },
      select: {
        id: true,
        price: true,
        quantity: true,
        createdAt: true,
        socialEventSchedule: {
          select: {
            socialEvent: true,
            schedule: true,
          },
        },
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
        socialEventSchedule: true,
      },
    });
    return res.status(200).json(response);
  }
);
