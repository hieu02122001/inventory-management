import { Request, Response } from 'express'
import { z } from 'zod'
import { compare } from 'bcrypt'
import { UserSchema } from '@root/lib'
import prisma from '@root/database'

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

  const existingUser = await prisma.user.findUnique({
    where: {
      username
    }
  })

  if (!existingUser) {
    return res.status(400).send({
      message: 'User not found'
    })
  }

  const passwordMatch = await compare(password, existingUser.passwordHash)

  if (!passwordMatch) {
    return res.status(400).send({
      message: 'Invalid password'
    })
  }

  return res.status(200).send({
    message: 'Login successful'
  })
}
