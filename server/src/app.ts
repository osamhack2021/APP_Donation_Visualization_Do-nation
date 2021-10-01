import express from "express"
import { RegisterRoutes } from "./routes/routes"

const port = process.env.PORT || 8000;
const app = express();

app.use(express.urlencoded({extended: true}));
app.use(express.json());

RegisterRoutes(app);

app.listen(port, () => 
    console.log(`Express server is running on http://localhost:${port}`)
)