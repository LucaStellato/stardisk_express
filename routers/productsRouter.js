const express = require('express')
const router = express.Router();
const productsController = require('../controllers/productsController')

//index
router.get('/', productsController.index)

module.exports = router;