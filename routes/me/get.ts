import { Request, Response } from 'express'

import type { Staff } from '@root/@types/express/custom'

export default async (req: Request, res: Response) => {
  const staff = req.user as Staff

  return res.send(staff)
}
