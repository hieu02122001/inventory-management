# Inventory management

- A paper inventory management application

## Installation

### Environment

- Node 18
  - nvm install 18
  - nvm alias default 18
- Docker

### Initial setup for local development

```shell
# Install dependencies
$ yarn install

# Create .env, mock files for development
$ yarn setup

# Build up MySQL with Docker
$ yarn dcc up -d

# Database migration
$ yarn prisma:migrate

# Start API server: default running on port 5004 (http://localhost:5004)
$ yarn dev
```

### Migrations commands

```shell
# Edit the model in ./prisma/schema.prisma

# Reformat the prisma model file
$ yarn prisma format

# Create migration file
$ yarn prisma migrate dev --create-only --name <name_file>`

# Run migration
$ yarn prisma:migrate
```

## Dev Rules / Guidelines
- Git commit rules: [Conventional Commits](https://gist.github.com/azoom-y-ishii/09296c786bf9ea2b4868b6beb4f4c35b)

## Other notes

### API definition

- This repo use nnn-router. To add a new route, create a new file with the name of the api verb (get, post, ...), and router will automatically add the new route to the app.

- To define a route definition, create a const named apiDefinition and add necessary properties to it. For example:

```
export const apiDefinition = {
  alias: 'defaultGet',
  description: 'Default Get endpoint',
  parameters: [
    {
      name: 'example-query-param',
      type: 'Query',
      description: 'example query param',
      schema: z.number()
    }
  ],
  response: z.object({
    message: z.string()
  })
}
```

The required properties is `response`. The description, parameters and alias are optional. But the alias must be unique through the app.

Inside the parameters, the `name`, `type` and `schema` are required. The `description` is optional.

Type must be one of `Query`, `Body`, `Path`, `Header`.

The `schema` is the zod schema of the parameter. For example: `z.number()`

- This project use tsc and tsc-alias for build and type checking. Will update if needed later.

- This project use eslint for linting and formatting but the rules are loose. Will update if needed later.
