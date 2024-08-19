const userRoute = require("./Routes/userRoute");
const express = require("express");
const bodyParser = require("body-parser");
const app = express();

app.use(bodyParser.json());

const port = 3000;

//local db just for testing cuz i don't have access to the cloud db
// const mongoUrl = process.env.MONGODB_URI;
const mongoUrl = "mongodb://localhost:27017/juju";

app.get("/", (req, res) => {
  res.send("Hello World!");
});

//connect to local db with mongoose
const mongoose = require("mongoose");
mongoose.connect(mongoUrl).then(() => {
  console.log("Connected to the database!");
  app.listen(port, () => {
    console.log(`App is running on http://localhost:${port}`);
  });
});

app.use("/users", userRoute);
