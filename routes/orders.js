const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController')


//show
router.get('/:id', orderController.show);

//store
router.post('/', orderController.store);




module.exports = router