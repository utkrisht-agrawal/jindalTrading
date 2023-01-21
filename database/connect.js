const Sequelize = require('sequelize');

const sequelize = new Sequelize('freedb_jindaltrading','freedb_utkrisht','2M8v6q9KM@NKz!d',{
    dialect: 'mysql',
    host: 'sql.freedb.tech'
});

module.exports = sequelize; 