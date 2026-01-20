const express = require("express");
const app = express();
const PORT = 3000;

const cors = require("cors");

// Routes
const productsRouter = require("./routes/products");
const ordersRouter = require('./routes/orders')
const artistRouter = require("./routes/artists");
const mailRouter = require("./routes/testMail")

// Middlewares
const notFound = require("./middlewares/notFound");
const serverError = require("./middlewares/serverError");

//welcome Mail
const welcomeMail = require("./services/mail")

// CORS policy
app.use(cors({
  origin: "http://localhost:5173"
}))

// body parser
app.use(express.json());

// static assets folder
app.use(express.static("public"));

app.listen(PORT, () => {
  console.log(`Server listening on http://localhost:${PORT}`);
});

app.get("/", (req, res) => {
  res.send("Stardisk API Server");
});

app.use("/api", mailRouter)
app.use("/api/products", productsRouter);
app.use("/api/order", ordersRouter);
app.use("/api/artist", artistRouter);


app.use(serverError);

app.use(notFound);