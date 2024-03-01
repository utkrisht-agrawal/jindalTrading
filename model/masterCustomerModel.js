const Sequelize = require('sequelize');

const sequelize = require('../database/connect');

const masterCustomerModel = sequelize.define('master_Customer',{
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
        allowNull: true
    },
    status: {
        type: Sequelize.ENUM("VERIFIED","UNVERIFIED" )
    },
    grade: {
        type: Sequelize.STRING
    },
    pincode: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    address: {
        type: Sequelize.STRING
    },
    referenceNumber1: {
        type: Sequelize.STRING
    },
    reference1ContactNumber: {
        type: Sequelize.STRING
    },
    referenceNumber2: {
        type: Sequelize.STRING
    },
    reference2ContactNumber: {
        type: Sequelize.STRING
    },
    creditLimit: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    creditDays: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    CustomerStatus: {
        type: Sequelize.ENUM("active","inactive" )
    }
},{
    timestamps: false
}); 

module.exports = masterCustomerModel