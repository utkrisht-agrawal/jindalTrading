const Sequelize = require('sequelize');

const sequelize = require('../database/connect');

const masterAreaModel = sequelize.define('master_area',{
    areaId:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    area: {
        type: Sequelize.STRING,
        allowNull: false
    }
},{
    timestamps: false
}); 

module.exports = masterAreaModel