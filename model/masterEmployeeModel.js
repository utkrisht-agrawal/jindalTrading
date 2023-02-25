const Sequelize = require('sequelize');

const sequelize = require('../database/connect');

const masterEmployeeModel = sequelize.define('master_employee',{
    employeeNumber:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    employeeName: {
        type: Sequelize.STRING,
        allowNull: false
    },
    designation: {
        type: Sequelize.STRING
    },
    employeeCategories: {
        type: Sequelize.STRING
    },
    dateOfBirth: {
        type: Sequelize.STRING
    },
    fatherName: {
        type: Sequelize.STRING
    },
    motherName: {
        type: Sequelize.STRING
    },
    address: {
        type: Sequelize.STRING
    },
    primaryMobileNumber: {
        type: Sequelize.BIGINT
    },
    officeMobileNumber: {
        type: Sequelize.INTEGER,
    },
    fatherMobileNumber: {
        type: Sequelize.INTEGER
    },
    motherMobileNumber: {
        type: Sequelize.INTEGER
    },
    spouseName: {
        type: Sequelize.STRING
    },
    spouseMobileNumber: {
        type: Sequelize.INTEGER
    },
    emailId: {
        type: Sequelize.STRING
    },
    officeEmailId: {
        type: Sequelize.STRING
    },
    area: {
        type: Sequelize.STRING
    },
    bankName: {
        type: Sequelize.STRING
    },
    bankAccountNumber: {
        type: Sequelize.INTEGER
    },
    ifscCode: {
        type: Sequelize.INTEGER
    },
    dateOfJoining: {
        type: Sequelize.INTEGER
    },
    aadharNumber: {
        type: Sequelize.INTEGER
    },
    panNumber: {
        type: Sequelize.INTEGER
    },
    reference: {
        type: Sequelize.STRING
    },
    gender: {
        type: Sequelize.STRING
    },
    photo: {
        type: Sequelize.STRING
    }
},{
    timestamps: false
}); 

module.exports = masterEmployeeModel