const Sequelize = require('sequelize');

const sequelize = require('../database/connect');

const transportTruckModel = sequelize.define('transport_Truck',{
    transportId:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    transportName: {
        type: Sequelize.STRING
    },
    transportTruck: {
        type: Sequelize.STRING
    },
    ownerMobileNumber: {
        type: Sequelize.INTEGER
    },
    driverMobileNumber: {
        type: Sequelize.INTEGER
    },
}); 

module.exports = transportTruckModel