const Sequelize = require('sequelize');

const sequelize = new Sequelize('jindaltrading','admin','clashlone##00Q',{
    dialect: 'mysql',
    host: 'jindaltradingdatabase.c7a4v7gkjhri.ap-south-1.rds.amazonaws.com'
});

module.exports = sequelize;
                         
