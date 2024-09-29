import { z } from 'zod'
import { ROLE } from '@root/constants'

export const UserSchema = z.object({
  id: z.number(),
  username: z.string(),
  passwordHash: z.string(),
  role: z.nativeEnum(ROLE),
  createdBy: z.number().nullable(),
  createdDatetime: z.coerce.date(),
  updatedDatetime: z.coerce.date()
})
