import HttpException from "../common/http-exception";
import { Request, Response, NextFunction } from "express";
import { ApiError } from "../common/api-error";

export const errorHandler = (
  error: HttpException,
  _req: Request,
  res: Response,
  _next: NextFunction
) => {
  const status = error.statusCode || error.status || 500;

  if (error instanceof ApiError) {
    res.status(error.code).json(error.message);
    return;
  }

  res.status(status).send(error);
};
