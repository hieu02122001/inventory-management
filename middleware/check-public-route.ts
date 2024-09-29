import { Request, Response, NextFunction } from 'express'

export default async (req: Request, res: Response, next: NextFunction) => {
  if (!isLoginRoute(req)) {
    return next()
  }

  req.isPublicRoute = true
  return next()
}

function isLoginRoute(req: Request) {
  return /login/.test(req.originalUrl)
}
