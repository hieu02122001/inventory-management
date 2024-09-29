import { Request } from 'express'

type Staff = {
  id: number
  username: string
  role: ROLE
}

declare module 'express-serve-static-core' {
  interface Request {
    user?: Staff
    isPublicRoute?: boolean
  }
}
