const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController')

//store

router.post('/', orderController.store);




module.exports = router