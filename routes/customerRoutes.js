const express = require('express');

const customerCtrl = require('../controller/customerController');

const router = express.Router();



router.get('/customerContact',customerCtrl.getCustomerContact);
router.post('/customerContact',customerCtrl.postCustomerContact);

router.get('/customerCategory',customerCtrl.getCustomerCategory);
router.post('/customerCategory',customerCtrl.postCustomerCategory);


module.exports = router;