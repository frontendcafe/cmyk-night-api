/**
 * Required External Modules and Interfaces
 */
import { Request, Response } from "express";

import { PrismaClient } from "@prisma/client";
import { catchAsync } from "../common/catch-async";
import { transformDocument } from "@prisma/client/runtime";

const prisma = new PrismaClient();

/**
 * Controller Definitions
 */

export const getEvents = catchAsync(
  async (_: Request, res: Response): Promise<Response> => {
    const response = await prisma.socialEvents.findMany({
      select: {
        avatar: true,
        banner: true,
        description: true,
        id: true,
        rating: true,
        title: true,
        type: true,
        performer: {
          select: {
            id: true,
            firstName: true,
            lastName: true,
          },
        },
        socialEventSchedule: {
          select: {
            id: true,
            remaining: true,
            enabled: true,
            price: true,
          },
        },
        location: {
          select: {
            id: true,
            address: {
              select: {
                id: true,
                formatted: true,
                city: true,
                state: true,
                country: true,
              },
            },
            attentionHours: {
              select: {
                id: true,
                day: true,
                hour: true,
              },
            },
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
