import express, { Application, Response } from "express";
import { PrismaClient } from "@prisma/client";
import cors from "cors";

const prisma = new PrismaClient();
const app: Application = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

app.get("/spending", async (req, res) => {
    const allSpending = await prisma.spending.findMany()
    const formattedSpending = allSpending.map((spending) => ({
      ...spending,
      record_time: spending.record_time.toString(),
    }))
    res.json(formattedSpending)
})

app.get("/users", async (req, res) => {
    const users = await prisma.users.findMany()
    res.json(users)
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});