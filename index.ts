import express from 'express'
import nnnRouter from '@azoom/nnn-router'
import requestLogger from '@middleware/request-logger'
import authHandler from '@middleware/auth'
import checkPublicRoute from './middleware/check-public-route'

const app = express()

app.use(requestLogger)
app.use(checkPublicRoute)
app.use(authHandler)
app.use(express.json())

const options = {
  routeDir: '/dist/routes'
}

app.use(nnnRouter(options))

const PORT = process.env.PORT || 5004
app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`)
})
