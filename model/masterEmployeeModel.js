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
        type: Sequelize.STRING,
    },
    fatherMobileNumber: {
        type: Sequelize.STRING
    },
    motherMobileNumber: {
        type: Sequelize.STRING
    },
    spouseName: {
        type: Sequelize.STRING
    },
    spouseMobileNumber: {
        type: Sequelize.STRING
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
        type: Sequelize.STRING
    },
    ifscCode: {
        type: Sequelize.STRING
    },
    dateOfJoining: {
        type: Sequelize.STRING
    },
    aadharNumber: {
        type: Sequelize.STRING
    },
    panNumber: {
        type: Sequelize.STRING
    },
    reference: {
        type: Sequelize.STRING
    },
    referenceContactNumber: {
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