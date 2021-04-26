/**
 * Required External Modules and Interfaces
 */
import { NextFunction, Request, Response } from "express";

import { PrismaClient } from "@prisma/client";
import { catchAsync } from "../common/catch-async";
import { ApiError } from "../common/api-error";
import { getUserById } from "./users.controller";

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

export const getOrderById = catchAsync(
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

export const createOrder = catchAsync<Response | void>(
  async (req: Request, res: Response, next: NextFunction) => {
    const { userId, socialEventScheduleId, quantity, price } = req.body;

    if (quantity <= 0) {
      next(
        ApiError.badRequest(
          `Invalid quantity, expected to be greather than 0 and received ${quantity}`
        )
      );
      return;
    }
    if (price <= 0) {
      next(
        ApiError.badRequest(
          `Invalid price, expected to be greather than 0 and received ${price}`
        )
      );
      return;
    }

    const socialEventSchedule = await prisma.socialEventSchedule.findUnique({
      where: { id: socialEventScheduleId },
    });

    if (
      !socialEventSchedule ||
      !socialEventSchedule.enabled ||
      socialEventSchedule.price !== price
    ) {
      next(ApiError.badRequest("Invalid SocialEventSchedule."));
      return;
    }

    const user = await prisma.users.findUnique({
      where: {
        id: userId,
      },
    });

    if (!user) {
      next(ApiError.badRequest("Invalid User."));
      return;
    }

    const order = await prisma.orders.create({
      data: {
        userId,
        socialEventScheduleId,
        quantity,
        price,
      },
    });

    return res.status(200).json(order);
  }
);
