const { QueryTypes } = require('sequelize');
const sequelize = require('../database/connect');
const masterAreaModel = require('../model/masterAreaModel');
const masterCategoriesModel = require('../model/masterCategoriesModel');
const masterCustomerModel = require('../model/masterCustomerModel');
const masterEmployeeModel = require('../model/masterEmployeeModel');
const masterGradeModel = require('../model/masterGradeModel');
const masterProductsModel = require('../model/masterProductsModel');
const masterProductGroupModel = require('../model/masterProductGroupModel');
const masterTeamsModel = require('../model/masterTeamsModel');
const masterVendorsModel = require('../model/masterVendorsModel');
const customerContactModel = require('../model/customerContactModel');
const customerCategoryModel = require('../model/customerCategoryModel');
const customerFirmModel = require('../model/customerFirmModel');
const customerProductModel = require('../model/customerProductModel');
const masterFirmModel = require('../model/masterFirmModel');
const vendorContactModel = require('../model/vendorContactModel');

const fs = require('fs');



const getMasterArea =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        console.log(`User Level :  ${req.session.userLevel}`);
        masterAreaModel.findAll()
        .then((data)=>{
            console.log(data);
            res.render('masterArea',{
                username : req.session.username,
                data:data,
                level: req.session.userLevel,
                msg:""
            })
        })
        .catch((err)=>
        console.log(err)
        )

    }
    else 
    {
        res.redirect('/')
    }
}

const postMasterArea =(req,res,next)=>{
    console.log(`check1 ${req.body.id}`);
    console.log(`check2 ${req.body.op}`);
    console.log(`check3 ${req.body.area}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        masterAreaModel.destroy({
            where: { areaId : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        masterAreaModel.update({
            area: req.body.eArea,
            district: req.body.eDistrict,
            zone: req.body.eZone,
            state: req.body.eState,
        },
        {
            where: {areaId: req.body.id}
        })
        .then((qwe)=>{
            res.send(qwe)
        })
        .catch((err)=>{
            console.log(err);
        })
        
    }
    else if(req.body.op==="fil")
    {
        console.log(req.body.areaFil);
        console.log(req.body.districtFil);
        let areaFil=req.body.areaFil;
        let districtFil=req.body.districtFil;
        let zoneFil=req.body.zoneFil;
        let stateFil=req.body.stateFil;

        sequelize.query("SELECT * FROM master_areas AS master_area WHERE (area IN (CASE WHEN ? !='' THEN (?) ELSE area END)) AND (district IN (CASE WHEN ? !='' THEN(?) ELSE district END)) AND (zone IN (CASE WHEN ? !='' THEN(?) ELSE zone END)) AND (state IN (CASE WHEN ? !='' THEN(?) ELSE state END))",
        {
            replacements: [areaFil,areaFil,districtFil,districtFil,zoneFil,zoneFil,stateFil,stateFil],
            type: QueryTypes.SELECT
        })
        .then((dataFil)=>{
            console.log(dataFil);
            res.send(dataFil);
                
        })
        .catch((err)=>
            console.log(err)
        )
        
        
    }
    else
    {
        const area = req.body.area;
        const district = req.body.district;
        const zone = req.body.zone;
        const state = req.body.state;
        masterAreaModel.findAll(
            {
                where : {area : area}
            }
        )
        .then((arearepdata)=>{
            if(arearepdata.length==0)
            {
                masterAreaModel.create({
                    area :area,
                    district :district,
                    zone :zone,
                    state :state
                })
                .then((result)=>{
                    console.log(result),
                    console.log('New Master Area added'),
                    res.redirect('/masterArea')
                })
                .catch((err)=>
                    console.log(err)
                )
            }
            else
            {
                masterAreaModel.findAll()
                    .then((data)=>{
                        console.log(data);
                        res.render('masterArea',{
                            username : req.session.username,
                            data:data,
                            level:req.session.userLevel,
                            msg:"Area Already Exists"
                        })
                    })
                    .catch((err)=>
                        console.log(err)
                    )
            }
        })
        .catch((err)=>
                console.log(err)
            )
        
        
    }
    
}




















const getMasterCategories =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {

        masterCategoriesModel.findAll()
            .then((data)=>{
                res.render('masterCategories',{
                    username : req.session.username,
                    data:data,
                    level:req.session.userLevel,
                    msg:""
                })
            })
            .catch((err)=>
            console.log(err)
            )
    }
    else 
    {
        res.redirect('/')
    }
}

const postMasterCategories =(req,res,next)=>{
    console.log("checking")
    var id = req.body.id;
    if(req.body.op==="del")
    {
        masterCategoriesModel.destroy({
            where: { categoriesId : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.ecategory);
        masterCategoriesModel.update({
            categoriesType: req.body.ecategory
        },
        {
            where: {categoriesId: req.body.id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else{
        const categoriesType = req.body.categoriesType;
        masterCategoriesModel.findAll(
            {
                where : {categoriesType : categoriesType}
            }
        )
        .then((catrepdata)=>{
            if(catrepdata.length==0)
            {
                masterCategoriesModel.create({
                    categoriesType : categoriesType
                })
                .then((result)=>
                    console.log(result),
                    console.log('New Master Category added'),
                    res.redirect('/masterCategories')
                )
                .catch((err)=>
                    console.log(err)
                )
            }
            else 
            {
                masterCategoriesModel.findAll()
                    .then((data)=>{
                        res.render('masterCategories',{
                            username : req.session.username,
                            data:data,
                            level:req.session.userLevel,
                            msg:"Category Already Exists"
                        })
                    })
                    .catch((err)=>
                    console.log(err)
                    )
            }
        })
        
    }
}

















const getMasterCustomer =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        masterGradeModel.findAll()
        .then((gradeData)=>{
            masterAreaModel.findAll()
            .then((areaData)=>{
                masterProductsModel.findAll()
                    .then((productData)=>{
                        masterCategoriesModel.findAll()
                        .then((categorydata)=>{
                            masterFirmModel.findAll()
                            .then((firmData)=>{
                                masterCustomerModel.findAll()
                                .then((data)=>{
                                    res.render('masterCustomer',
                                    {
                                        username : req.session.username,
                                        data:data,
                                        categorydata:categorydata,
                                        productData:productData,
                                        level:req.session.userLevel,
                                        gradeData:gradeData,
                                        areaData:areaData,
                                        firmData:firmData,
                                        msg:""
                                    })
                    
                                })
                                .catch((err)=>
                                    console.log(err)
                                )
                            })
                            .catch((err)=>
                                console.log(err)
                            )
                        })
                        .catch((err)=>
                            console.log(err)
                        )
                    })
                    .catch((err)=>
                        console.log(err)
                    )
            })
            .catch((err)=>
                console.log(err)
            )
        })
        .catch((err)=>
            console.log(err)
        )
        
    }
    else 
    {
        res.redirect('/')
    }
}

const postMasterCustomer =(req,res,next)=>{
    var id = req.body.id;
    
    if(req.body.op==="del")
    {
        masterCustomerModel.destroy({
            where: { customerId : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    
    else if(req.body.op==="edt")
    {

        masterCustomerModel.update({
            customerName: req.body.customerName,
            area: req.body.area,
            status: req.body.status,
            grade: req.body.grade,
            pincode: req.body.pincode  || null,
            address: req.body.address,
            referenceNumber1: req.body.referenceNumber1,
            reference1ContactNumber: req.body.reference1ContactNumber || null,
            referenceNumber2: req.body.referenceNumber2,
            reference2ContactNumber: req.body.reference2ContactNumber || null,
            creditLimit: req.body.creditLimit,
            creditDays: req.body.creditDays

          },
          {
              where: {customerId: req.body.id}
          }
        )
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="fil")
    {
        console.log(req.body.customerNameFil);
        console.log(req.body.areaFil);
        console.log(req.body.statusFil);
        console.log(req.body.gradeFil);
        let cust=req.body.customerNameFil;
        let area=req.body.areaFil;
        let stat=req.body.statusFil;
        let grad=req.body.gradeFil;

        sequelize.query("SELECT * FROM master_customers AS master_customer WHERE (customerName IN (CASE WHEN ? !='' THEN (?) ELSE customerName END)) AND (area IN (CASE WHEN ? !='' THEN(?) ELSE area END)) AND (status IN (CASE WHEN ? !='' THEN(?) ELSE status END)) AND (grade IN (CASE WHEN ? !='' THEN(?) ELSE grade END))",
        {
            replacements: [cust,cust,area,area,stat,stat,grad,grad],
            type: QueryTypes.SELECT
        })
        .then((dataFil)=>{
            console.log(dataFil);
            res.send(dataFil);
                
        })
        .catch((err)=>
            console.log(err)
        )
        
        
    }
    else if(req.body.op==="cinf")
    {
        console.log(req.body.value);
        
        customerContactModel.findAll({
            where : {customerName : req.body.value}
        })
        .then((cntctdata)=>{   
            console.log("11111111111111111111111111111111111111111111111111");     
            console.log(cntctdata);     
            masterCustomerModel.findAll({
                where : {customerName : req.body.value}
            })
            .then((data)=>
            {
                console.log("222222222222222222222222222222222222222222222222");     
                console.log(data);     
                // Object.assign(cntctdata, data);
                customerProductModel.findAll({
                    where : {customerName : req.body.value}
                })
                .then((prdctdata)=>{
                    console.log("333333333333333333333333333333333333333333");     
                    console.log(prdctdata);     
                    customerCategoryModel.findAll({
                        where : {customerName : req.body.value}
                    })    
                    .then((catdata)=>{
                        console.log("44444444444444444444444444444444444444444444444444");     
                        console.log(catdata);     
                        customerFirmModel.findAll({
                            where : {customerName : req.body.value}
                        })
                        .then((firmData)=>{
                            console.log(firmData);     
                            console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                            console.log(prdctdata);
                            console.log("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
                            if(data.length!=0 && cntctdata.length!=0 && prdctdata.length!=0 && catdata.length!=0  )
                            {
                                console.log("1111111111111111111111111111111111111111");
                                console.log(data[0].dataValues)
                                console.log("222222222222222222222222222222222222222222");
                                console.log(cntctdata[0].dataValues)
                                console.log("3333333333333333333333333333333333333333333333");
                                console.log(catdata[0].dataValues)
                                console.log("444444444444444444444444444444444444");
                                console.log(firmData[0].dataValues)
                                console.log("55555555555555555555555555555555555");
                                let sData = {
                                    ...data[0].dataValues,
                                    ...cntctdata[0].dataValues,
                                    ...catdata[0].dataValues,
                                    ...firmData[0].dataValues
                                };
                                let fData = { 
                                    ...sData,
                                    ...prdctdata
                                }
                                
                                console.log("----------------------------------------------")        
                                console.log(sData)  
                                console.log("----------------------------------------------")        
                                console.log(fData)
                                
                                console.log("----------------------------------------------")        
                                res.send(fData)
                            }
                            else
                            {
                                res.send(null)
                            }
                            
                        })
                        .catch((err)=>{
                            console.log(err);
                        })    
                    })
                    .catch((err)=>{
                        console.log(err);
                    })  
                })
                .catch((err)=>{
                    console.log(err);
                })          
            })
            .catch((err)=>{
                console.log(err);
            })
        })
        .catch((err)=>{
            console.log(err)
        })
    
        
    }
    else if(req.body.op==="marktrep")
    {
        console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        customerProductModel.findAll({
            where : {customerId : req.body.value}
        })
        .then((holidata)=>{
            console.log(holidata);
            let custname=holidata[0].customerName;
            marketPlanPigIronModel.findAll({
                where : {customerName : custname}
            })
            .then((reprtData)=>
            {
                console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                console.log(reprtData)
                res.send(reprtData)
            })
            .catch((err)=>{
                console.log(err);
            })
        })
        .catch((err)=>{
            console.log(err);
        })
    }
   
    else {
        console.log("9999999999999999999999999999999999999999999")
        console.log(req.body.customerName)
        console.log("9999999999999999999999999999999999999999999")
        masterCustomerModel.findAll(
            {
                where:{customerName : req.body.customerName}
            }
            )
            .then((data)=>
            {
                console.log("1111111111111111111111111111111111111111111")
                console.log(data);
                console.log("1111111111111111111111111111111111111111111")
                if(data.length==0)
                {
                    const customerName = req.body.customerName
                    const firm = req.body.firm
                    const area = req.body.area
                    const status = req.body.status
                    const grade = req.body.grade
                    const productFil = req.body.productFil
                    const contact = req.body.contact || null
                    const designation = req.body.designation
                    const email = req.body.email
                    const category = req.body.category
                    const pincode = req.body.pincode || null
                    const address = req.body.address
                    const referenceNumber1 = req.body.referenceNumber1
                    const reference1ContactNumber = req.body.reference1ContactNumber || null
                    const referenceNumber2 = req.body.referenceNumber2
                    const reference2ContactNumber = req.body.reference2ContactNumber  || null
                    const creditLimit = req.body.creditLimit || null
                    const creditDays = req.body.creditDays || null
            
                    masterCustomerModel.create({
                        customerName: customerName,
                        area: area,
                        status: status,
                        grade: grade,
                        pincode: pincode,
                        address: address,
                        referenceNumber1: referenceNumber1,
                        reference1ContactNumber: reference1ContactNumber,
                        referenceNumber2: referenceNumber2,
                        reference2ContactNumber: reference2ContactNumber,
                        creditLimit: creditLimit,
                        creditDays: creditDays
                    })
                    .then((result) => {
                        customerContactModel.create({
                            customerName: customerName,
                            mobileNumber: contact,
                            designation: designation,
                            email: email
                        })
                        .then((res2) => {
                            customerCategoryModel.create({
                                customerName: customerName,
                                category: category
                            })
                            .then((res3) => {
                                if (firm) { // Check if firm exists
                                    customerFirmModel.create({
                                        customerName: customerName,
                                        firm: firm
                                    })
                                    .then((res4) => {
                                        console.log(res4);
                                    })
                                    .catch((err) => {
                                        console.log(err);
                                    });
                                }
                                if (productFil) {
                                    if (Array.isArray(productFil)) {
                                        console.log("::::::::::::::::::::::::::::::::::::::::::::::::::");
                                        console.log(productFil);
                                        for (let i = 0; i < productFil.length; i++) {
                                            console.log(productFil[i]);
                                            customerProductModel.create({
                                                customerName: customerName,
                                                product: productFil[i]
                                            })
                                            .then((reso) => {
                                                console.log(reso);
                                            })
                                            .catch((err) => {
                                                console.log(err);
                                            });
                                        }
                                    } else {
                                        customerProductModel.create({
                                            customerName: customerName,
                                            product: productFil
                                        })
                                        .then((reso) => {
                                            console.log(reso);
                                        })
                                        .catch((err) => {
                                            console.log(err);
                                        });
                                    }
                                }
                                console.log(result);
                                console.log(res2);
                                console.log(res3);
                                console.log('New Master Customer added');
                                res.redirect('/masterCustomer');
                            })
                            .catch((err) => {
                                console.log(err);
                            });
                        })
                        .catch((err) => {
                            console.log(err);
                        });
                    })
                    .catch((err) => {
                        console.log(err);
                    });
                    
                    
                }
                else
                {
                    console.log(req.session.username)
                    var dataFil="abc";
                    console.log(dataFil);
                    if(req.session.isLoggedIn)
                    {
                        masterGradeModel.findAll()
                        .then((gradeData)=>{
                            masterAreaModel.findAll()
                            .then((areaData)=>{
                                masterProductsModel.findAll()
                                    .then((productData)=>{
                                        masterCategoriesModel.findAll()
                                        .then((categorydata)=>{
                                            masterFirmModel.findAll()
                                            .then((firmData)=>{
                                                masterCustomerModel.findAll()
                                                .then((data)=>{
                                                    res.render('masterCustomer',
                                                    {
                                                        username : req.session.username,
                                                        data:data,
                                                        categorydata:categorydata,
                                                        productData:productData,
                                                        level:req.session.userLevel,
                                                        gradeData:gradeData,
                                                        areaData:areaData,
                                                        firmData:firmData,
                                                        msg:"Customer Name Already Exists"
                                                    })
                                    
                                                })
                                                .catch((err)=>
                                                    console.log(err)
                                                )
                                            })
                                            .catch((err)=>
                                                console.log(err)
                                            )
                                        })
                                        .catch((err)=>
                                            console.log(err)
                                        )
                                    })
                                    .catch((err)=>
                                        console.log(err)
                                    )
                            })
                            .catch((err)=>
                                console.log(err)
                            )
                        })
                        .catch((err)=>
                            console.log(err)
                        )
                        
                    }
                    else 
                    {
                        res.redirect('/')
                    }
                }
            })
            .catch((err)=>
            console.log(err)
            )
    }
}



















const getMasterEmployee =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        masterAreaModel.findAll()
        .then((areaData)=>{
            masterEmployeeModel.findAll()
            .then((data)=>{
                res.render('masterEmployee',{
                    areaData:areaData,
                    username : req.session.username,
                    data:data,
                    level:req.session.userLevel,
                    msg:""
                })
            })
            .catch((err)=>
            console.log(err)
            )
        })
        .catch((err)=>
            console.log(err)
        )
       
    }
    else 
    {
        res.redirect('/')
    }
}

const postMasterEmployee =(req,res,next)=>{
    var id = req.body.id;
    if(req.body.op==="del")
    {
        masterEmployeeModel.destroy({
            where: { employeeNumber : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="edt")
    {

        masterEmployeeModel.update({
            
            employeeName: req.body.employeeName,
            designation: req.body.designation,
            employeeCategories: req.body.employeeCategories,
            dateOfBirth: req.body.dateOfBirth,
            fatherName: req.body.fatherName,
            motherName: req.body.motherName,
            address: req.body.address,
            primaryMobileNumber: req.body.primaryMobileNumber,
            officeMobileNumber: req.body.officeMobileNumber,
            fatherMobileNumber: req.body.fatherMobileNumber,
            motherMobileNumber: req.body.motherMobileNumber,
            spouseName: req.body.spouseName,
            spouseMobileNumber: req.body.spouseMobileNumber,
            emailId: req.body.emailId,
            officeEmailId: req.body.officeEmailId,
            bankName: req.body.bankName,
            bankAccountNumber: req.body.bankAccountNumber,
            ifscCode: req.body.ifscCode,
            dateOfJoining: req.body.dateOfJoining,
            aadharNumber: req.body.aadharNumber,
            panNumber: req.body.panNumber,
            reference: req.body.reference,
            referenceContactNumber: req.body.referenceContactNumber,
            gender: req.body.gender
          },
          {
              where: {employeeNumber: req.body.id}
          }
        )
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="fil")
    {
        console.log(req.body.employeeNameFil);
        console.log(req.body.designationFil);
        console.log(req.body.employeeCategoriesFil);
        let emp=req.body.employeeNameFil;
        let des=req.body.designationFil;
        let cat=req.body.employeeCategoriesFil;

        sequelize.query("SELECT * FROM master_employees AS master_employee WHERE (employeeName IN (CASE WHEN ? !='' THEN (?) ELSE employeeName END)) AND (designation IN (CASE WHEN ? !='' THEN(?) ELSE designation END)) AND (employeeCategories IN (CASE WHEN ? !='' THEN(?) ELSE employeeCategories END)) ",
        {
            replacements: [emp,emp,des,des,cat,cat],
            type: QueryTypes.SELECT
        })
        .then((dataFil)=>{
            console.log(dataFil);
            res.send(dataFil);
                
        })
        .catch((err)=>
            console.log(err)
        )
        
    
    }
    
    else 
    {
        const employeeName = req.body.employeeName
        const designation = req.body.designation
        const employeeCategories = req.body.employeeCategories
        const dateOfBirth = req.body.dateOfBirth
        const fatherName = req.body.fatherName
        const motherName = req.body.motherName
        const address = req.body.address
        const primaryMobileNumber = req.body.primaryMobileNumber
        const officeMobileNumber = req.body.officeMobileNumber
        const fatherMobileNumber = req.body.fatherMobileNumber
        const motherMobileNumber = req.body.motherMobileNumber
        const spouseName = req.body.spouseName
        const spouseMobileNumber = req.body.spouseMobileNumber
        const emailId = req.body.emailId
        const officeEmailId = req.body.officeEmailId
        const area = req.body.area
        const bankName = req.body.bankName
        const bankAccountNumber = req.body.bankAccountNumber
        const ifscCode = req.body.ifscCode
        const dateOfJoining = req.body.dateOfJoining
        const aadharNumber = req.body.aadharNumber
        const panNumber = req.body.panNumber
        const reference = req.body.reference
        const referenceContactNumber = req.body.referenceContactNumber
        const gender = req.body.gender
        const photo = req.file
        
        console.log(photo);
        imagePath=photo?photo.path:"No image";
        console.log(imagePath)
        

        masterEmployeeModel.findAll(
            {
                where : {employeeName : employeeName}
            }
        )
        .then((emprepdata)=>{
            if(emprepdata.length==0)
            {
                masterEmployeeModel.create({
                    employeeName:employeeName,
                    designation:designation,
                    employeeCategories:employeeCategories,
                    dateOfBirth:dateOfBirth,
                    fatherName:fatherName,
                    motherName:motherName,
                    address:address,
                    primaryMobileNumber:primaryMobileNumber,
                    officeMobileNumber:officeMobileNumber,
                    fatherMobileNumber:fatherMobileNumber,
                    motherMobileNumber:motherMobileNumber,
                    spouseName:spouseName,
                    spouseMobileNumber:spouseMobileNumber,
                    emailId:emailId,
                    officeEmailId:officeEmailId,
                    area:area,
                    bankName:bankName,
                    bankAccountNumber:bankAccountNumber,
                    ifscCode:ifscCode,
                    dateOfJoining:dateOfJoining,
                    aadharNumber:aadharNumber,
                    panNumber:panNumber,
                    reference:reference,
                    referenceContactNumber:referenceContactNumber,
                    gender:gender,
                    photo:imagePath
                })
                .then((result)=>
                    console.log(result),
                    console.log('New Master Employee added'),
                    res.redirect('/masterEmployee')
                )
                .catch((err)=>
                    console.log(err)
                )
            }
            else 
            {
                masterAreaModel.findAll()
                    .then((areaData)=>{
                        masterEmployeeModel.findAll()
                        .then((data)=>{
                            res.render('masterEmployee',{
                                areaData:areaData,
                                username : req.session.username,
                                data:data,
                                level:req.session.userLevel,
                                msg:"Employee Already Exists"
                            })
                        })
                        .catch((err)=>
                        console.log(err)
                        )
                    })
                    .catch((err)=>
                        console.log(err)
                    )
            }
        })
    }
}
















const getMasterGrade =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {

        masterGradeModel.findAll()
        .then((data)=>{
            res.render('masterGrade',{
                username : req.session.username,
                data:data,
                level:req.session.userLevel,
                msg:""
            })
        })
        .catch((err)=>
        console.log(err)
        )
    }
    else 
    {
        res.redirect('/')
    }
}

const postMasterGrade =(req,res,next)=>{
    var id = req.body.id;
    
    if(req.body.op==="del")
    {
        masterGradeModel.destroy({
            where: { gradeId : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.egrade);
        masterGradeModel.update({
            gradeType: req.body.egrade
        },
        {
            where: {gradeId: req.body.id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else
    {
        const gradeType = req.body.gradeType;
        console.log(`noooooooooooooooooooooooooooooooooooo ${gradeType}`)
       
        masterGradeModel.findAll(
            {
                where : {gradeType : gradeType}
            }
        )
        .then((grdrepdata)=>{
            if(grdrepdata.length==0)
            {
                masterGradeModel.create({
                    gradeType :gradeType
                })
                    .then((result)=>
                        console.log(result),
                        console.log('New Master Grade added'),
                        res.redirect('/masterGrade')
                    )           
                    .catch((err)=>
                        console.log(err)
                    )
            }
            else
            {
                masterGradeModel.findAll()
                .then((data)=>{
                    res.render('masterGrade',{
                        username : req.session.username,
                        data:data,
                        level:req.session.userLevel,
                        msg:"Grade already present"
                    })
                })
                .catch((err)=>
                    console.log(err)
                )
            }
        })
        .catch((err)=>
                console.log(err)
            )
    }
}

















const getMasterProducts =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        masterProductGroupModel.findAll()
        .then((prodGrp)=>{

            masterProductsModel.findAll()
            .then((data)=>{
                res.render('masterProducts',{
                    username : req.session.username,
                    data:data,
                    level:req.session.userLevel,
                    msg:"",
                    prodGrp:prodGrp
                })
            })
            .catch((err)=>
            console.log(err)
            )
        })
        .catch((err)=>
            console.log(err)
        )
    }
    else 
    {
        res.redirect('/')
    }
}

const postMasterProducts =(req,res,next)=>{
    var id = req.body.id;
    
    
    if(req.body.op==="del")
    {
        masterProductsModel.destroy({
            where: { productId : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.eproductGroup);
        console.log(req.body.id);
        masterProductsModel.update({
            productName: req.body.eproductName,
            productGroup: req.body.eproductGroup
        },
        {
            where: {productId: req.body.id}
        }
        )
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="fil")
    {
        console.log(req.body.productNameFil);
        console.log(req.body.productGroupFil);
        let prd=req.body.productNameFil;
        let pgrp=req.body.productGroupFil;

        sequelize.query("SELECT * FROM master_products AS master_products WHERE (productName IN (CASE WHEN ? !='' THEN (?) ELSE productName END)) AND (productGroup IN (CASE WHEN ? !='' THEN(?) ELSE productGroup END)) ",
        {
            replacements: [prd,prd,pgrp,pgrp],
            type: QueryTypes.SELECT
        })
        .then((dataFil)=>{
            console.log(dataFil);
            res.send(dataFil);
                
        })
        .catch((err)=>
            console.log(err)
        )
        
        
    }
    else{
        const productName = req.body.productName;
        const productGroup = req.body.productGroup;
       
        masterProductsModel.findAll(
            {
                where : {productName : productName}
            }
        )
        .then((prdrepdata)=>{
            if(prdrepdata.length==0)
            {
                masterProductsModel.create({
                    productName :productName,
                    productGroup :productGroup
                })
                    .then((result)=>
                    console.log(result),
                    console.log('New Master Product added'),
                    res.redirect('/masterProducts')
                    )           
                    .catch((err)=>
                        console.log(err)
                    )
            }
            else
            {
                masterProductGroupModel.findAll()
                .then((prodGrp)=>{
        
                    masterProductsModel.findAll()
                    .then((data)=>{
                        res.render('masterProducts',{
                            username : req.session.username,
                            data:data,
                            level:req.session.userLevel,
                            msg:"Product Already Present",
                            prodGrp:prodGrp
                        })
                    })
                    .catch((err)=>
                    console.log(err)
                    )
                })
                .catch((err)=>
                    console.log(err)
                )
            }
        })
        .catch((err)=>
                console.log(err)
            )
    }
}
















const getMasterProductGroup =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        masterProductGroupModel.findAll()
        .then((data)=>{
            res.render('masterProductGroup',{
                username : req.session.username,
                data:data,
                level:req.session.userLevel,
                msg:""
            })
        })
        .catch((err)=>
        console.log(err)
        )
    }
    else 
    {
        res.redirect('/')
    }
}

const postMasterProductGroup =(req,res,next)=>{
    
    var id = req.body.id;
    console.log("pppppppppppppppppppppppppp")    
    if(req.body.op==="del")
    {
        masterProductGroupModel.destroy({
            where: { id : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.eproductGroup);
        console.log(req.body.id);
        masterProductGroupModel.update({
            productGroup: req.body.eproductGroup
        },
        {
            where: {id: req.body.id}
        }
        )
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    
    else{
        const productGroup = req.body.productGroup;
       
        masterProductGroupModel.findAll(
            {
                where : {productGroup : productGroup}
            }
        )
        .then((prdrepdata)=>{
            if(prdrepdata.length==0)
            {
                masterProductGroupModel.create({
                    productGroup :productGroup
                })
                    .then((result)=>
                    console.log(result),
                    console.log('New Master Product added'),
                    res.redirect('/masterProductGroup')
                    )           
                    .catch((err)=>
                        console.log(err)
                    )
            }
            else
            {
                masterProductGroupModel.findAll()
                .then((data)=>{
                    res.render('masterProductGroup',{
                        username : req.session.username,
                        data:data,
                        level:req.session.userLevel,
                        msg:"Product Group already present"
                    })
                })
                .catch((err)=>
                console.log(err)
                )
            }
        })
        .catch((err)=>
                console.log(err)
            )
    }
}

















const getMasterTeams =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        masterEmployeeModel.findAll()
        .then((empData)=>{
            masterTeamsModel.findAll()
            .then((data)=>{
                res.render('masterTeams',{
                    username : req.session.username,
                    data:data,
                    empData:empData,
                    level:req.session.userLevel,
                    msg:""
                })
            })
            .catch((err)=>
                console.log(err)
            )
        })
        .catch((err)=>
            console.log(err)
        )
        
    }
    else 
    {
        res.redirect('/')
    }
}
const postMasterTeams =(req,res,next)=>{
    var id = req.body.id;
    
    if(req.body.op==="del")
    {
        masterTeamsModel.destroy({
            where: { teamId : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.eteamMember);
        console.log(req.body.eteamLeader);
        console.log(req.body.id);
        masterTeamsModel.update({
            teamMember: req.body.eteamMember,
            teamLeader: req.body.eteamLeader
        },
        {
            where: {teamId: req.body.id}
        }
        )
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="fil")
    {
        console.log(req.body.teamMemberFil);
        console.log(req.body.teamLeaderFil);
        let mem=req.body.teamMemberFil;
        let lead=req.body.teamLeaderFil;

        sequelize.query("SELECT * FROM master_teams AS master_teams WHERE (teamMember IN (CASE WHEN ? !='' THEN (?) ELSE teamMember END)) AND (teamLeader IN (CASE WHEN ? !='' THEN(?) ELSE teamLeader END)) ",
        {
            replacements: [mem,mem,lead,lead],
            type: QueryTypes.SELECT
        })
        .then((dataFil)=>{
            console.log(dataFil);
            res.send(dataFil);
                
        })
        .catch((err)=>
            console.log(err)
        )
        
        
    }
    else
    {
        const teamMember = req.body.teamMember;
        const teamLeader = req.body.teamLeader;
        
        masterTeamsModel.findAll(
            {
                where : {teamMember : teamMember}
            }
        )
        .then((memrepdata)=>{
            if(memrepdata.length==0)
            {
                masterTeamsModel.create({
                    teamMember :teamMember,
                    teamLeader :teamLeader
                })
                    .then((result)=>
                        console.log(result),
                        console.log('New Master Team added'),
                        res.redirect('/masterTeams')
                    )           
                    .catch((err)=>
                        console.log(err)
                    )
            }
            else
            {
                masterEmployeeModel.findAll()
        .then((empData)=>{
            masterTeamsModel.findAll()
            .then((data)=>{
                res.render('masterTeams',{
                    username : req.session.username,
                    data:data,
                    empData:empData,
                    level:req.session.userLevel,
                    msg:"Member Already Present"
                })
            })
            .catch((err)=>
                console.log(err)
            )
        })
        .catch((err)=>
            console.log(err)
        )
            }
        })
        .catch((err)=>
                console.log(err)
            )
        
    }
}









const getMasterVendors =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        masterAreaModel.findAll()
            .then((areaData)=>{
                masterVendorsModel.findAll()
                .then((data)=>{
                    res.render('masterVendors',{
                        areaData:areaData,
                        username : req.session.username,
                        data:data,
                        level:req.session.userLevel,
                        msg:""
                    })
                })
                .catch((err)=>
                    console.log(err)
                )
                
            })
            .catch((err)=>
                console.log(err)
            )
        
    }
    else 
    {
        res.redirect('/')
    }
}

const postMasterVendors =(req,res,next)=>{
    var id = req.body.id;
    
    if(req.body.op==="del")
    {
        masterVendorsModel.destroy({
            where: { vendorId : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.evendorArea);
        console.log(req.body.evendorAddress);
        console.log(req.body.id);
        masterVendorsModel.update({
            vendorAddress: req.body.evendorAddress,
            area: req.body.evendorArea
        },
        {
            where: {vendorId: req.body.id}
        }
        )
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="fil")
    {
        console.log(req.body.vendorAddressFil);
        console.log(req.body.vendorAreaFil);
        let add=req.body.vendorAddressFil;
        let area=req.body.vendorAreaFil;

        sequelize.query("SELECT * FROM master_vendors AS master_vendors WHERE (vendorAddress IN (CASE WHEN ? !='' THEN (?) ELSE vendorAddress END)) AND (area IN (CASE WHEN ? !='' THEN(?) ELSE area END)) ",
        {
            replacements: [add,add,area,area],
            type: QueryTypes.SELECT
        })
        .then((dataFil)=>{
            console.log(dataFil);
            res.send(dataFil);
                
        })
        .catch((err)=>
            console.log(err)
        )
        
        
    }
    else
    {
        // const vendorId = req.body.vendorId;
        const vendorName = req.body.vendorName;
        const vendorAddress = req.body.vendorAddress;
        const area = req.body.area;
       
        masterVendorsModel.findAll(
            {
                where : {vendorName : vendorName}
            }
        )
        .then((venrepdata)=>{
            if(venrepdata.length==0)
            {
                masterVendorsModel.create({
                    vendorName :vendorName,
                    vendorAddress :vendorAddress,
                    area :area
                })
                .then((result)=>{
                    // console.log(result)
                    console.log("andrrrrrrrr")
                    vendorContactModel.create({
                        vendorName :req.body.vendorName,
                        mobileNumber :req.body.mobileNumber,
                        designation :req.body.designation,
                        email :req.body.email
                    })
                    .then((result)=>
                    // console.log(result),
                    console.log('New Master Vendor added'),
                    res.redirect('/masterVendors')
                    )           
                    .catch((err)=>
                        console.log(err)
                    )
                })
                .catch((err)=>
                    console.log(err)
                )
            }
            else
            {
                masterAreaModel.findAll()
                .then((areaData)=>{
                    masterVendorsModel.findAll()
                    .then((data)=>{
                        res.render('masterVendors',{
                            areaData:areaData,
                            username : req.session.username,
                            data:data,
                            level:req.session.userLevel,
                            msg:"Vendor Name already exist"
                        })
                    })
                    .catch((err)=>
                        console.log(err)
                    )
                
            })
            .catch((err)=>
                console.log(err)
            )
            }
        })
        .catch((err)=>
                console.log(err)
            )
    }
}










module.exports = {
    getMasterArea,
    postMasterArea,

    getMasterCategories,
    postMasterCategories,

    getMasterCustomer,
    postMasterCustomer,

    getMasterEmployee,
    postMasterEmployee,

    getMasterGrade,
    postMasterGrade,

    getMasterProducts,
    postMasterProducts,

    getMasterProductGroup,
    postMasterProductGroup,

    getMasterTeams,
    postMasterTeams,

    getMasterVendors,
    postMasterVendors
    // getAddMasterVendors,
    // postAddMasterVendors
}