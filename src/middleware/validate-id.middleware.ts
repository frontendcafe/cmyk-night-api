import { Request, Response, NextFunction } from "express";
import { ApiError } from "../common/api-error";

export const validateId = (
  req: Request,
  _res: Response,
  next: NextFunction
) => {
  if (!req.params.id || !+req.params.id) {
    next(
      ApiError.badRequest(
        `Invalid ID argument. Expected to be number but received ${
          req.params?.id
        } of type: ${typeof req.params?.id}`
      )
    );
    return;
  }
  next();
};
