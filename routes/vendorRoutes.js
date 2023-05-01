const express = require('express');

const vendorCtrl = require('../controller/vendorController');

const router = express.Router();

router.get('/vendorContacts',vendorCtrl.getVendorContacts);
router.post('/vendorContacts',vendorCtrl.postVendorContacts);

module.exports = router;