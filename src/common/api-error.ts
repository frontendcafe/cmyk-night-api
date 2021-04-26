export class ApiError {
  constructor(public message: string, public code: number = 500) {}

  static badRequest(msg: string) {
    return new ApiError(msg, 400);
  }

  static internalServerError(msg: string) {
    return new ApiError(msg);
  }
}
