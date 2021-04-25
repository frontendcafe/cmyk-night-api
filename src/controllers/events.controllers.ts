/**
 * Required External Modules and Interfaces
 */
import { Request, Response } from "express";

import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

/**
 * Controller Definitions
 */

export const getEvents = async (
  _: Request,
  res: Response
): Promise<Response> => {
  const response = await prisma.socialEvents.findMany({
    select: {
      title: true,
      avatar: true,
      banner: true,
      description: true,
      rating: true,
    },
  });

  return res.status(200).json(response);
};

export const getEventById = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const { id } = req.params;
  const response = await prisma.socialEvents.findUnique({
    where: { id: +id },
    include: {
      performer: true,
      socialEventSchedule: true,
    },
  });

  return res.status(200).json(response);
};
