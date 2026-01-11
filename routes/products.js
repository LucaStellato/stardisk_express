const express = require("express");
const router = express.Router();

const productController = require("../controllers/productController")

// /api/products
router.get("/", productController.index);

// /api/products/:id
router.get("/:id", productController.show);

module.exports = router;