import express, { Application, Response } from "express";
import { PrismaClient } from "@prisma/client";
import cors from "cors";

const prisma = new PrismaClient();
const app: Application = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

async function main() {
    // ... you will write your Prisma Client queries here
    const newUser = await prisma.users.create({
      data: {
        name: 'Alice',
        email: 'Alice@gmail.com',
      },
    })
    const allUsers = await prisma.users.findMany()
    console.log(allUsers)
  }

app.get("/", (_req, res: Response) => {
  res.send(`Server is running on port: ${port}`);
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })