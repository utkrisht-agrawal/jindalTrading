const Sequelize = require('sequelize');

const sequelize = require('../database/connect');

const marketPlanQuantityLedgerModel = sequelize.define('market_plan_quantity_ledger',{
    serialNumber:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    customerId: {
        type: Sequelize.STRING,
        allowNull: false
    },
    category: {
        type: Sequelize.STRING,
        allowNull: false
    },
    product: {
        type: Sequelize.STRING,
        allowNull: false
    },
    quantity: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    
    
},{
    timestamps: true
}); 

module.exports = marketPlanQuantityLedgerModel