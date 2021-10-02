import express, { Request as ExRequest, Response as ExResponse } from "express";
import { RegisterRoutes } from "./routes/routes";
import swaggerUI from "swagger-ui-express";
import "reflect-metadata";
import { createConnection } from "typeorm";
import { Target } from "./entity/target";
import { Donation } from "./entity/donation";

(async () => {
  const port = process.env.PORT || 8000;
  const app = express();

  app.use(express.urlencoded({ extended: true }));
  app.use(express.json());

  createConnection({
    type: "mysql",
    host: "localhost",
    port: 3306,
    username: "root",
    password: "1234",
    database: "do_nation",
    synchronize: true,
    logging: false,
    entities: [Target, Donation],
  });

  app.use(
    "/docs",
    swaggerUI.serve,
    async (_req: ExRequest, _res: ExResponse) => {
      return _res.send(
        swaggerUI.generateHTML(await import("../build/swagger.json"))
      );
    }
  );

  RegisterRoutes(app);

  app.listen(port, () =>
    console.log(`Express server is running on http://localhost:${port}`)
  );
})();
