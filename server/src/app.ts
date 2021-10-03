import express, { Request as ExRequest, Response as ExResponse } from "express";
import { RegisterRoutes } from "./routes/routes";
import swaggerUI from "swagger-ui-express";
import "reflect-metadata";
import { createConnection } from "typeorm";
import { Target } from "./entity/target";
import { Donation } from "./entity/donation";
import { PORT, __prod__ } from "./constants";

(async () => {
  await createConnection({
    type: "mysql",
    host: "localhost",
    port: 3306,
    username: "root",
    password: "1234",
    database: "do_nation",
    synchronize: !__prod__,
    logging: !__prod__,
    entities: [Target, Donation],
  }).catch((error) => console.error(`connection error: ${error}`));

  const app = express();
  app.use(express.urlencoded({ extended: true }));
  app.use(express.json());
  app.use(
    "/docs",
    swaggerUI.serve,
    async (_req: ExRequest, _res: ExResponse) => {
      return _res.send(swaggerUI.generateHTML(await import("../swagger.json")));
    }
  );

  RegisterRoutes(app);

  app.listen(PORT, () =>
    console.log(`Express server is running on http://localhost:${PORT}`)
  );
})();
