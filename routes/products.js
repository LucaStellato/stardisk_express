const express = require("express");
const router = express.Router();

const productController = require("../controllers/productController")

// /api/products
router.get("/", productController.index);

router.get("/search", productController.search);

// /api/products/:id
router.get("/:slug", productController.show);

//related products
router.get('/:slug/related', productController.related);


module.exports = router;