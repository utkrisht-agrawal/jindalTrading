const express = require('express');

const marketPlanController = require('../controller/marketPlanController');

const router = express.Router();

router.get('',)

router.get('/marketPlanPigIron',marketPlanController.getMarketPlanPigIron);
router.post('/marketPlanPigIron',marketPlanController.postMarketPlanPigIron);
router.get('/marketPlanQuantityLedger',marketPlanController.getMarketPlanQuantityLedger);
router.post('/marketPlanQuantityLedger',marketPlanController.postMarketPlanQuantityLedger);

module.exports = router;