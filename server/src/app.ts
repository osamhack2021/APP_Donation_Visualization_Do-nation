import express, { Request as ExRequest, Response as ExResponse } from "express";
import { RegisterRoutes } from "./routes/routes";
import swaggerUI from "swagger-ui-express";

const port = process.env.PORT || 8000;
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use("/docs", swaggerUI.serve, async (_req: ExRequest, _res: ExResponse) => {
  return _res.send(
    swaggerUI.generateHTML(await import("../build/swagger.json"))
  );
});

RegisterRoutes(app);

app.listen(port, () =>
  console.log(`Express server is running on http://localhost:${port}`)
);
