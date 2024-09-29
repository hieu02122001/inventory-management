import { Request, Response, NextFunction } from 'express'
import prisma from '@root/database'

export default async (req: Request, res: Response, next: NextFunction) => {
  if (req.isPublicRoute) {
    return next()
  }

  const username = req.headers['x-username'] as string | undefined

  if (!username) {
    return res.status(401).send({
      message: 'Unauthorized'
    })
  }

  const user = await prisma.user.findUnique({
    where: {
      username
    }
  })

  if (!user) {
    return res.status(401).send({
      message: 'Unauthorized'
    })
  }

  req.user = {
    id: user.id,
    username: user.username,
    role: user.role
  }

  next()
}
