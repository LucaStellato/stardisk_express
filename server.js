const express = require("express");
const app = express();
const PORT = 3000;

const cors = require("cors");

// Routes
const productsRouter = require("./routes/products");

// Middlewares
const notFound = require("./middlewares/notFound");
const serverError = require("./middlewares/serverError");

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

app.use("/api/products", productsRouter);

app.use(serverError);

app.use(notFound);