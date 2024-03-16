const Sequelize = require('sequelize');

const sequelize = new Sequelize('jindaltrading','root','31098',{
    dialect: 'mysql',
    host: 'localhost'
});
 
module.exports = sequelize;  