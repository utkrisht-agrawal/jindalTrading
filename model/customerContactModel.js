const Sequelize = require('sequelize');

const sequelize = require('../database/connect');

const customerContactModel = sequelize.define('cust_contact',{
    customerId:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    customerName: {
        type: Sequelize.STRING
    },
    mobileNumber: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    designation: {
        type: Sequelize.STRING
    },
    email: {
        type: Sequelize.STRING
    }
}); 

module.exports = customerContactModel