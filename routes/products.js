const express = require("express");
const router = express.Router();

const productController = require("../controllers/productController")

// /api/products
router.get("/", productController.index);

// /api/products/:id
router.get("/:slug", productController.show);

router.get("/:slug/artist", productController.showArtist);

module.exports = router;