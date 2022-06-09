import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";
dotenv.config();
import * as edgedb from "edgedb";
import cors from "cors";
import e from "./dbschema/edgeql-js";

const app: Express = express();
const client = edgedb.createClient();
const port = process.env.APP_PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/pokemons", async (_req: Request, res: Response) => {
  try {
    const query = e.select(e.Pokemon, (pokemon: any) => ({
      id: true,
      name: true,
      description: true,
      height: true,
      weight: true,
    }));

    const result = await query.run(client);
    res.status(200).send(result);
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
});

app.get("/battles", async (_req: Request, res: Response) => {
  try {
    const query = e.select(e.Battle, (battle: any) => ({
      id: true,
      contender: { name: true },
      opponent: { name: true },
      filter: e.op(battle.result, "=", "won"),
    }));

    const result = await query.run(client);
    res.status(200).send(result);
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
});

app.post("/pokemon", async (req: Request, res: Response) => {
  try {
    console.log("req.body", req.body);
    const query = e.insert(e.Pokemon, {
      name: req.body.name,
      description: req.body.description,
      height: req.body.height,
      weight: req.body.weight,
    });
    const result = await query.run(client);
    res.status(200).send(result);
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
});

app.post("/battles", async (_req: Request, res: Response) => {
  try {
    res.status(200).send({});
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
});

app.listen(port, () => {
  console.log(`[server]: Server is running at https://localhost:${port}`);
});
