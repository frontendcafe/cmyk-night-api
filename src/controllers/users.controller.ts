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

export const getUsers = catchAsync(
  async (_: Request, res: Response): Promise<Response> => {
    const response = await prisma.users.findMany();

    return res.status(200).json(response);
  }
);

export const getUserById = catchAsync(
  async (req: Request, res: Response): Promise<Response> => {
    const id = parseInt(req.params.id, 10);

    const response = await prisma.users.findUnique({
      where: { id },
    });

    return res.status(200).send(response);
  }
);
