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
        type: Sequelize.STRING,
        allowNull: true
    },
    employeeCategories: {
        type: Sequelize.STRING,
        allowNull: true
    },
    dateOfBirth: {
        type: Sequelize.STRING,
        allowNull: true
    },
    fatherName: {
        type: Sequelize.STRING,
        allowNull: true
    },
    motherName: {
        type: Sequelize.STRING,
        allowNull: true
    },
    address: {
        type: Sequelize.STRING,
        allowNull: true
    },
    primaryMobileNumber: {
        type: Sequelize.BIGINT,
        allowNull: true
    },
    officeMobileNumber: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    fatherMobileNumber: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    motherMobileNumber: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    spouseName: {
        type: Sequelize.STRING,
        allowNull: true
    },
    spouseMobileNumber: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    emailId: {
        type: Sequelize.STRING,
        allowNull: true
    },
    officeEmailId: {
        type: Sequelize.STRING,
        allowNull: true
    },
    area: {
        type: Sequelize.STRING,
        allowNull: true
    },
    bankName: {
        type: Sequelize.STRING,
        allowNull: true
    },
    bankAccountNumber: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    ifscCode: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    dateOfJoining: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    aadharNumber: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    panNumber: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    reference: {
        type: Sequelize.STRING,
        allowNull: true
    },
    gender: {
        type: Sequelize.STRING,
        allowNull: true
    },
    photo: {
        type: Sequelize.STRING,
        allowNull: true
    }
},{
    timestamps: false
}); 

module.exports = masterEmployeeModel