import express from "express";
import booksRouter from "./routes/books.js";
import usersRouter from "./routes/users.js";

import log from "./middleware/logMiddleware.js";

import errorHandler from "./middleware/errorHandler.js";
import "dotenv/config";
import "./utils/instrument.js";
import * as Sentry from "@sentry/node";

const app = express();

app.use(express.json());

app.use(log);

app.use("/books", booksRouter);
app.use("/users", usersRouter);

app.get("/", (req, res) => {
  res.send("Hello world!");
});

Sentry.setupExpressErrorHandler(app);

app.use(errorHandler);

app.listen(3000, () => {
  console.log("Server is listening on port 3000");
});
