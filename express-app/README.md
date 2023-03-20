# Node.js + Express.js + Prisma ORM + PostgreSQL + Docker

- TypeScript (https://github.com/Microsoft/TypeScript)
- Express.js (https://github.com/expressjs/express)
- Prisma ORM (https://github.com/prisma/prisma)
- PostgreSQL (https://www.postgresql.org/)
- pgAdmin GUI tool for PostgreSQL (https://www.pgadmin.org/)
- Docker-Compose for running all together

## Requirements:

- docker (https://docs.docker.com/get-docker/)

## Quick Start

1. Run Docker container to start the API server and PostgreSQL database

```
docker compose up --build
```

### Access to PGAmin

- go to [localhost:5555](http://localhost:5555)
- login with: `pgadmin4@pgadmin.org / admin` (as a default)
  - **Hostname/address**: `postgres` (as a default)
  - **username/password**: `postgres` (as a default)

## Local Development

### Requirements:

- Node.js 14 version or higher

---

1. Stop Prisma container `docker stop prisma-api` (container name from .yml file)

- **Make sure that you have `.env` file inside prisma directory with this content**

```
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/TEST_DB?schema=public"
```

2. Access pgAdmin at [localhost:5555](http://localhost:5555)

3. Establish a server with postgresql container's IP address. To check the IP address of the container, run `docker inspect [container id of postgres]` in your terminal.

4. Check if database postgres is created. Ensure there is data in the database.

5. Install dependencies `npm i`

6. Run `npx prisma generate` for recreating connection

7. Run `npm run dev` for starting local API server

### Recreate Docker containers

> Let's say you made changes to Prisma API server source code and want to check how it works together with the rest of the Docker services.

- You can recreate only one compose service: `docker-compose up -d --force-recreate --no-deps prisma-app`

- Or recreate all the containers: `docker-compose up -d --build --force-recreate`
