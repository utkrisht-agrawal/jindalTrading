const { QueryTypes } = require('sequelize');
const sequelize = require('../database/connect');
const marketPlanPigIronModel = require('../model/marketPlanPigIronModel');
const marketPlanQuantityLedgerModel = require('../model/marketPlanQuantityLedgerModel');
const marketPlanAllotmentModel = require('../model/marketPlanAllotmentModel');
const masterAreaModel = require('../model/masterAreaModel');
const masterGradeModel = require('../model/masterGradeModel');
const masterCategoriesModel = require('../model/masterCategoriesModel');
const masterCustomerModel = require('../model/masterCustomerModel');
const masterProductsModel = require('../model/masterProductsModel');
const masterTeamsModel = require('../model/masterTeamsModel');
const customerContactModel = require('../model/customerContactModel');
const customerCategoryModel = require('../model/customerCategoryModel');
const customerFirmModel = require('../model/customerFirmModel');
const customerProductModel = require('../model/customerProductModel');
const masterFirmModel = require('../model/masterFirmModel');



const getMarketPlanPigIron = (req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        console.log(`User Level :  ${req.session.userLevel}`);
        if(req.session.userLevel==1)
        {
            marketPlanPigIronModel.findAll()
            .then((data)=>{
                console.log(data);
                masterAreaModel.findAll()
                .then((areaData)=>{  
                    masterGradeModel.findAll()
                    .then((gradeData)=>{
                        masterProductsModel.findAll()
                        .then((productData)=>{
                            masterCategoriesModel.findAll()
                            .then((catdata)=>{
                                masterCustomerModel.findAll(
                                    {
                                        where : {status : "VERIFIED"}
                                    }
                                )
                                .then((custdata)=>{
                                    masterTeamsModel.findAll()
                                    .then((teamData)=>{
                                        masterFirmModel.findAll()
                                        .then((firmData)=>{
                                            customerProductModel.findAll()
                                            .then((custProdData)=>{
                                             
                                                res.render('marketPlanPigIron',{
                                                    username : req.session.username,
                                                    level: req.session.userLevel,
                                                    data:data,
                                                    dataFil:[],
                                                    areaData:areaData,
                                                    gradeData:gradeData,
                                                    catdata:catdata,
                                                    custdata:custdata,
                                                    teamData:teamData,
                                                    productData:productData,
                                                    firmData:firmData,
                                                    custProdData:custProdData
                                                })
                                            })
                                            .catch((err)=>{
                                                console.log(err)
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
            marketPlanPigIronModel.findAll()
            .then((data)=>{
                console.log(data);
                masterAreaModel.findAll()
                .then((areaData)=>{  
                    masterGradeModel.findAll()
                    .then((gradeData)=>{
                        masterProductsModel.findAll()
                        .then((productData)=>{
                            masterCategoriesModel.findAll()
                            .then((catdata)=>{
                                masterCustomerModel.findAll(
                                    {
                                        where : {status : "VERIFIED"}
                                    }
                                )
                                .then((custdata)=>{
                                    masterTeamsModel.findAll()
                                    .then((teamData)=>{
                                        masterFirmModel.findAll()
                                        .then((firmData)=>{
                                            customerProductModel.findAll()
                                            .then((custProdData)=>{
                                                console.log("hellow" ,custProdData)
                                                res.render('marketPlanPigIron',{
                                                    username : req.session.username,
                                                    level: req.session.userLevel,
                                                    data:data,
                                                    dataFil:[],
                                                    areaData:areaData,
                                                    gradeData:gradeData,
                                                    catdata:catdata,
                                                    custdata:custdata,
                                                    teamData:teamData,
                                                    productData:productData,
                                                    firmData:firmData,
                                                    custProdData:custProdData
                                                })
                                            })
                                            .catch((err)=>{
                                                console.log(err)
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
                })
                .catch((err)=>
                    console.log(err)
                )
    
            })
            .catch((err)=>
                console.log(err)
            )
        }

    }
    else 
    {
        res.redirect('/')
    }
}

const postMarketPlanPigIron = (req,res,next)=>{
    console.log("checking")
    var id = req.body.id;
    if(req.body.op==="del")
    {
        marketPlanPigIronModel.destroy({
            where: { serialNumber : id}
        })
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="uedt")
    {
        console.log("uEdit");
        const nxtDate = req.body.nextDate;
        console.log(nxtDate)
        marketPlanPigIronModel.findAll(
            {
                where : {serialNumber : req.body.id}
            }
        )
        .then((data)=>{
            console.log(data)
            console.log(data[0].nextDate)
            console.log("****************************************")
            console.log("****************************************")
            console.log("****************************************")
            console.log("****************************************")
            console.log("****************************************")
            console.log("****************************************")
            if(nxtDate!=data[0].nextDate && nxtDate)
            {
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                marketPlanPigIronModel.create({
                    customerName: req.body.customerName,
                    area: req.body.area,
                    grade: req.body.grade,
                    category: req.body.category,
                    product: req.body.product,
                    lastDelivery: req.body.lastDelivery,
                    representative: req.body.representative,
                    phoneNumber: req.body.phoneNumber,
                    meetingDates: nxtDate
                })
                .then((result)=>
                console.log(result),
                console.log('New Market Plan added'),
                res.redirect('/marketPlanPigIron')
                )
                .catch((err)=>
                console.log(err)
                )
            }
            
            console.log(req.body.id);
            marketPlanPigIronModel.update({
                    
                    currentRemark: req.body.currentRemark,
                    
                    nextDate: req.body.nextDate,
                    currentIssue: req.body.currentIssue,
                    
                },
                {
                    where: {serialNumber: req.body.id}
                }
                )
            .then((qwe)=>{
                res.send("kyu")
            })
            .catch((err)=>{
                    console.log(err);
            })
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op==="edt")
    {
        const nxtDate = req.body.nextDate;
        console.log(nxtDate)
        marketPlanPigIronModel.findAll(
            {
                where : {serialNumber : req.body.id}
            }
        )
        .then((data)=>{
            console.log(data)
            console.log(data[0].nextDate)
            console.log("****************************************")
            console.log("****************************************")
            console.log("****************************************")
            console.log("****************************************")
            console.log("****************************************")
            console.log("****************************************")
            if(nxtDate!=data[0].nextDate && nxtDate)
            {
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                console.log("/=/+/+/++/+/+/+/++/+/+/+/+/+/+/+/+/+/")
                marketPlanPigIronModel.create({
                    customerName: req.body.customerName,
                    area: req.body.area,
                    grade: req.body.grade,
                    category: req.body.category,
                    product: req.body.product,
                    lastDelivery: req.body.lastDelivery,
                    representative: req.body.representative,
                    phoneNumber: req.body.phoneNumber,
                    meetingDates: nxtDate
                })
                .then((result)=>
                console.log(result),
                console.log('New Market Plan added'),
                res.redirect('/marketPlanPigIron')
                )
                .catch((err)=>
                console.log(err)
                )
            }
            
            console.log(req.body.id);
            marketPlanPigIronModel.update({
                    area: req.body.area,
                    grade: req.body.grade,
                    category: req.body.category,
                    product: req.body.product,
                    lastDelivery: req.body.lastDelivery,
                    representative: req.body.representative,
                    phoneNumber: req.body.phoneNumber,
                    meetingDates: req.body.meetingDates,
                    currentRemark: req.body.currentRemark,
                    remarkStatus: req.body.remarkStatus,
                    nextDate: req.body.nextDate,
                    currentIssue: req.body.currentIssue,
                    analysed: req.body.analysed,
                    updateTimeStamp: req.body.updateTimeStamp,
                    totalIssue: req.body.totalIssue
                },
                {
                        where: {serialNumber: req.body.id}
                    }
                    )
            .then((qwe)=>{
                res.send("kyu")
            })
            .catch((err)=>{
                    console.log(err);
            })
        })
        .catch((err)=>{
            console.log(err);
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
    
    else if(req.body.op==="cinf")
    {
        console.log("########################################")
        console.log(req.body.value);
        console.log("########################################")
        
        customerContactModel.findAll({
            where : {customerName : req.body.value}
        })
        .then((cntctdata)=>{      
            console.log("----------------------------------------------------") 
            console.log(cntctdata) 

            masterCustomerModel.findAll({
                where : {customerName : req.body.value}
            })
            .then((data)=>
            {
                console.log(data);
                // Object.assign(cntctdata, data);
                customerProductModel.findAll({
                    where : {customerName : req.body.value}
                })
                .then((prdctdata)=>{
                    customerCategoryModel.findAll({
                        where : {customerName : req.body.value}
                    })    
                    .then((catdata)=>{
                        customerFirmModel.findAll({
                            where : {customerName : req.body.value}
                        })
                        .then((firmData)=>{
                            marketPlanPigIronModel.findAll({
                                where : {customerName : req.body.value}
                            })
                            .then((reprtData)=>{
                                console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                console.log(catdata.length);
                                console.log("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
                                console.log(prdctdata.length);
                                console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                console.log(data);
                                console.log("######################################");
                                console.log(cntctdata.length);
                                console.log("***************************************");

                               if(data.length!=0 && cntctdata.length!=0 && prdctdata.length!=0 && catdata.length!=0  )
                                {
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
                                    let tData = { 
                                        ...fData,
                                        ...reprtData
                                    }
                                    console.log("----------------------------------------------")        
                                    console.log(sData)  
                                    console.log("----------------------------------------------")        
                                    console.log(fData)
                                    console.log("----------------------------------------------")        
                                    console.log(tData)
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
                console.log(err);
            })
        })
        .catch((err)=>{
            console.log(err)
        })
    
        
    }
    else if(req.body.op==="fil")
    {
        console.log(req.body.customerNameFil);
        console.log(req.body.areaFil);
        console.log(req.body.gradeFil);
        console.log(req.body.categoryFil);
        console.log(req.body.productFil);
        console.log(req.body.representativeFil);
        console.log(req.session.username);
        let cust=req.body.customerNameFil;
        let area=req.body.areaFil;
        let grad=req.body.gradeFil;
        let cate=req.body.categoryFil;
        let prod=req.body.productFil;
        let represent=req.body.representativeFil;

        // var cust=(req.body.customerNameFil==""?"mppi.customerName":req.body.customerNameFil)
        // var area=(req.body.areaFil==""?"mppi.area":req.body.areaFil)
        // var grad=(req.body.gradeFil==""?"mppi.grade":req.body.gradeFil)
        // var cate=(req.body.categoryFil==""?"mppi.category":req.body.categoryFil)
        // var prod=(req.body.productFil==""?"mppi.product":req.body.productFil)
        // var represent=(req.body.representativeFil==""?"mppi.representative":req.body.representativeFil)


        
        var repUser=req.session.username;

        if(req.session.userLevel==1)
        {
            sequelize.query("SELECT * FROM market_plan_pig_irons AS market_plan_pig_iron WHERE (customerName IN (CASE WHEN ? !='' THEN (?) ELSE customerName END)) AND (area IN (CASE WHEN ? !='' THEN(?) ELSE area END)) AND (grade IN (CASE WHEN ? !='' THEN(?) ELSE grade END)) AND (category IN (CASE WHEN ? !='' THEN(?) ELSE category END)) AND (product IN (CASE WHEN ? !='' THEN(?) ELSE product END)) AND (representative IN (CASE WHEN ? !='' THEN(?) ELSE representative END)) AND (representative IN (CASE WHEN ? !='' THEN(?) ELSE representative END))",
            
            {
                replacements: [cust,cust,area,area,grad,grad,cate,cate,prod,prod,represent,represent,repUser,repUser],
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

            // sequelize.query("SELECT * FROM market_plan_pig_irons AS mppi WHERE (mppi.customerName IN (?)) AND (mppi.area IN (REPLACE(?,''',''))) AND (mppi.grade IN (?)) AND (mppi.category IN (?)) AND (mppi.product IN (?)) AND (mppi.representative IN (?))",
            // {
            //     replacements: [cust,area,grad,cate,prod,represent],
            sequelize.query("SELECT * FROM market_plan_pig_irons AS market_plan_pig_iron WHERE (customerName IN (CASE WHEN ? !='' THEN (?) ELSE customerName END)) AND (area IN (CASE WHEN ? !='' THEN(?) ELSE area END)) AND (grade IN (CASE WHEN ? !='' THEN(?) ELSE grade END)) AND (category IN (CASE WHEN ? !='' THEN(?) ELSE category END)) AND (product IN (CASE WHEN ? !='' THEN(?) ELSE product END)) AND (representative IN (CASE WHEN ? !='' THEN(?) ELSE representative END)) ",
            {
                replacements: [cust,cust,area,area,grad,grad,cate,cate,prod,prod,represent,represent],
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
        
    }
    else {
        const customerName = req.body.customerName;
        const categoryProduct = req.body.categoryProduct;
        const representative = req.body.representative;
        const meetingDates = req.body.meetingDates;
        const lastDelivery = req.body.lastDelivery;
    
        console.log(categoryProduct);
        console.log(categoryProduct.substring(0, 1));
    
        var cat;
        if (categoryProduct.substring(0, 1) == 'R') {
            cat = "Retail";
        } else if (categoryProduct.substring(0, 1) == 'T') {
            cat = "Trader";
        } else if (categoryProduct.substring(0, 1) == 'W') {
            cat = "Wholesale";
        }
    
        console.log(cat);
        console.log(categoryProduct.substring(1));
    
        var prd = categoryProduct.substring(1);
    
        masterCustomerModel.findAll({
            where: { customerName: customerName }
        })
            .then((custData) => {
                console.log("custoid" , custData)
                customerContactModel.findOne({
                    where: { customerName: custData[0].customerId }
                })
                    .then((contact) => {
                        console.log("contact" , contact)    
                        marketPlanPigIronModel.create({
                            customerName: customerName,
                            area: custData[0].area, // Uncomment and complete
                            grade: custData[0].grade, // Uncomment and complete
                            category: cat,
                            product: prd,
                            representative: representative,
                            phoneNumber: contact.mobileNumber,
                            meetingDates: meetingDates,
                            lastDelivery: lastDelivery,
                            // Uncomment and complete other fields
                        })
                            .then((result) => {
                                console.log(result);
                                console.log('New Market Plan added');
                                res.redirect('/marketPlanPigIron');
                            })
                            .catch((err) => console.log(err));
                    })
                    .catch(err => console.log(err));
            })
            .catch((err) => {
                console.log(err);
                // Handle the error appropriately
                res.status(500).send("Internal Server Error");
            });
    }
    
}















const getMarketPlanQuantityLedger =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        marketPlanQuantityLedgerModel.findAll()
            .then((data)=>{
                masterCategoriesModel.findAll()
                    .then((catdata)=>{
                        masterProductsModel.findAll()
                        .then((pdata)=>{
                            masterCustomerModel.findAll()
                            .then((custData)=>
                            {

                                res.render('marketPlanQuantityLedger',{
                                    data:data,
                                    catdata:catdata,
                                    pdata:pdata,
                                    custData:custData,
                                    username : req.session.username,
                                    level: req.session.userLevel,
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
    }
}
const postMarketPlanQuantityLedger =(req,res,next)=>{
    console.log("checking")
    var id = req.body.id;
    if(req.body.op==="del")
    {
        marketPlanQuantityLedgerModel.destroy({
            where: { serialNumber : id}
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
        console.log("ok buddy")
        console.log(req.body.id);
        marketPlanQuantityLedgerModel.update({
            customerId: req.body.customerId,
            category: req.body.category,
            product: req.body.product,
            quantity: req.body.quantity,
            invoiceNumber: req.body.invoiceNumber,
            delivery: req.body.delivery
        },
        {
            where: {serialNumber: req.body.id}
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
        console.log("king")
        marketPlanQuantityLedgerModel.create({
            customerName: req.body.customerName,
            category: req.body.category,
            product: req.body.product,
            quantity: req.body.quantity,
            invoiceNumber: req.body.invoiceNumber,
            delivery: req.body.delivery
        })
        .then((result)=>
            console.log(result),
            console.log('New Market QuantityLedger added'),
            res.redirect('/marketPlanQuantityLedger')
        )
        .catch((err)=>
            console.log(err)
        )
    }
}




const getMarketPlanAllotment =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        if(req.session.userLevel == 1)
        {
            marketPlanAllotmentModel.findAll(
                {
                    where : {representative : req.session.username}
                }
            )
            .then((data)=>{
                masterAreaModel.findAll()
                    .then((adata)=>{
                        masterProductsModel.findAll()
                            .then((pdata)=>{
                                res.render('marketPlanAllotment',{
                                    data:data,
                                    adata:adata,
                                    pdata:pdata,
                                    username : req.session.username,
                                    level: req.session.userLevel,
                            })
                            .catch((err)=>
                                console.log(err)
                            )
                    })
                    .catch((err)=>
                        console.log(err)
                    )

                    })
            })
            .catch((err)=>
                console.log(err)
            )
        }
        else
        {
            marketPlanAllotmentModel.findAll()
            .then((data)=>{
                masterAreaModel.findAll()
                    .then((adata)=>{
                        masterProductsModel.findAll()
                            .then((pdata)=>{
                                res.render('marketPlanAllotment',{
                                    data:data,
                                    adata:adata,
                                    pdata:pdata,
                                    username : req.session.username,
                                    level: req.session.userLevel,
                            })
                            .catch((err)=>
                                console.log(err)
                            )
                    })
                    .catch((err)=>
                        console.log(err)
                    )

                    })
            })
            .catch((err)=>
                console.log(err)
            )
        }
    }
}
const postMarketPlanAllotment =(req,res,next)=>{
    console.log("checking")
    var id = req.body.id;
    if(req.body.op==="del")
    {
        marketPlanAllotmentModel.destroy({
            where: { serialNumber : id}
        })
        .then((result)=>
            console.log("kios check"),
            res.redirect('/marketPlanAllotment'),
            console.log("kios check2")
        )
        .catch((err)=>
        console.log(err)
    )
    }
    else if(req.body.op==="edt")
    {
        console.log("ok buddy")
        console.log(req.body.id);
        marketPlanAllotmentModel.update({
            customerId: req.body.customerId,
            phoneNumber: req.body.phoneNumber,
            area: req.body.area,
            product: req.body.product,
            representative: req.body.representative,
            meetingDates: req.body.meetingDates,
            currentIssue: req.body.currentIssue
        },
        {
            where: {serialNumber: req.body.id}
        }
        )
    }
    else{
        console.log("king")
        marketPlanAllotmentModel.create({
            customerId: req.body.customerId,
            phoneNumber: req.body.phoneNumber,
            area: req.body.area,
            product: req.body.product,
            representative: req.body.representative,
            meetingDates: req.body.meetingDates,
            currentIssue: req.body.currentIssue
        })
        .then((result)=>
            console.log(result),
            console.log('New Market Allotment added'),
            res.redirect('/marketPlanAllotment')
        )
        .catch((err)=>
            console.log(err)
        )
    }
}



module.exports = {
    getMarketPlanPigIron,
    postMarketPlanPigIron,
    getMarketPlanQuantityLedger,
    postMarketPlanQuantityLedger,
    getMarketPlanAllotment,
    postMarketPlanAllotment
}