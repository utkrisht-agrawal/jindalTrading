const Sequelize = require('sequelize');

const sequelize = require('../database/connect');

const masterCustomerModel = sequelize.define('master_customer',{
    customerId:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    customerName:{
        type: Sequelize.STRING
    },
    area: {
        type: Sequelize.STRING,
        allowNull: false
    },
    status: {
        type: Sequelize.ENUM("VERIFIED","UNVERIFIED","INACTIVE")
    },
    grade: {
        type: Sequelize.STRING
    },
    pincode: {
        type: Sequelize.INTEGER
    },
    address: {
        type: Sequelize.STRING
    },
    referenceNumber1: {
        type: Sequelize.STRING
    },
    referenceNumber2: {
        type: Sequelize.STRING
    },
    creditLimit: {
        type: Sequelize.INTEGER
    },
    creditDays: {
        type: Sequelize.INTEGER
    }
},{
    timestamps: false
}); 

module.exports = masterCustomerModel