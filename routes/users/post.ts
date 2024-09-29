import { Request, Response } from 'express'
import { z } from 'zod'
import { hash } from 'bcrypt'
import { UserSchema } from '@root/lib'
import prisma from '@root/database'
import { ROLE } from '@root/constants'

import type { Staff } from '@root/@types/express/custom'

const UserBodyRequestSchema = z.object({
  username: UserSchema.shape.username,
  password: z.string()
})

type UserBodyRequest = z.infer<typeof UserBodyRequestSchema>

const BCRYPT_SALT_ROUNDS = 8

export default async (req: Request, res: Response) => {
  const validateResult = UserBodyRequestSchema.safeParse(req.body)

  if (!validateResult.success) {
    return res.status(400).send(validateResult.error.errors)
  }

  const { username, password } = req.body as UserBodyRequest
  const user = req.user as Staff

  const existingUser = await prisma.user.findUnique({
    where: {
      username
    }
  })

  if (existingUser) {
    return res.status(400).send({
      message: 'User already exists'
    })
  }

  const passwordHash = await hash(password, BCRYPT_SALT_ROUNDS)

  await prisma.user.create({
    data: {
      username,
      role: ROLE.STAFF,
      passwordHash,
      createdBy: user.id
    }
  })

  return res.status(201).send({
    message: 'User created'
  })
}
