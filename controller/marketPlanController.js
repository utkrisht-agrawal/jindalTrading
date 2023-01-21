const { QueryTypes } = require('sequelize');
const sequelize = require('../database/connect');
const marketPlanPigIronModel = require('../model/marketPlanPigIronModel');
const marketPlanQuantityLedgerModel = require('../model/marketPlanQuantityLedgerModel');
const masterAreaModel = require('../model/masterAreaModel');
const masterGradeModel = require('../model/masterGradeModel');


const getMarketPlanPigIron = (req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        console.log(`User Level :  ${req.session.userLevel}`);
        if(req.session.userLevel==1)
        {
            marketPlanPigIronModel.findAll(
                {
                    where : {representative : req.session.username}
                }
            )
            .then((data)=>{
                console.log(data);
                masterAreaModel.findAll()
                .then((areaData)=>{  
                    masterGradeModel.findAll()
                    .then((gradeData)=>{
                        res.render('marketPlanPigIron',{
                            username : req.session.username,
                            data:data,
                            dataFil:[],
                            areaData:areaData,
                            gradeData:gradeData,
                            level: req.session.userLevel
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
                        res.render('marketPlanPigIron',{
                            username : req.session.username,
                            data:data,
                            dataFil:[],
                            areaData:areaData,
                            gradeData:gradeData,
                            level: req.session.userLevel
                        })
                        console.log(gradeData);
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
        .then((result)=>
            console.log("kios check"),
            res.redirect('/marketPlanPigIron'),
            console.log("kios check2")
        )
        .catch((err)=>
        console.log(err)
    )
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.serialNumber);
        marketPlanPigIronModel.update({
            customerId: req.body.customerId,
            area: req.body.area,
            grade: req.body.grade,
            category: req.body.category,
            product: req.body.product,
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
    }
    else if(req.body.op==="fil")
    {
        console.log(req.body.customerIdFil);
        console.log(req.body.areaFil);
        console.log(req.body.gradeFil);
        console.log(req.body.categoryFil);
        console.log(req.body.productFil);
        console.log(req.body.representativeFil);
        console.log(req.session.username);
        var cust=(req.body.customerIdFil==""?"mppi.customerId":req.body.customerIdFil)
        var area=(req.body.areaFil==""?"mppi.area":req.body.areaFil)
        var grad=(req.body.gradeFil==""?"mppi.grade":req.body.gradeFil)
        var cate=(req.body.categoryFil==""?"mppi.category":req.body.categoryFil)
        var prod=(req.body.productFil==""?"mppi.product":req.body.productFil)
        var represent=(req.body.representativeFil==""?"mppi.representative":req.body.representativeFil)
        // let dummy= JSON.parse('hello',);
        // console.log(dummy);
        // console.log(typeof(dummy))
        
        var repUser=req.session.username;

        // if(req.session.userLevel==1)
        // {
        //     sequelize.query("SELECT * FROM market_plan_pig_irons AS market_plan_pig_iron WHERE (customerId IN (CASE WHEN ? !='' THEN (?) ELSE customerId END)) AND (area IN (CASE WHEN ? !='' THEN(?) ELSE area END)) AND (grade IN (CASE WHEN ? !='' THEN(?) ELSE grade END)) AND (category IN (CASE WHEN ? !='' THEN(?) ELSE category END)) AND (product IN (CASE WHEN ? !='' THEN(?) ELSE product END)) AND (representative IN (CASE WHEN ? !='' THEN(?) ELSE representative END)) AND (representative IN (CASE WHEN ? !='' THEN(?) ELSE representative END))",
        //     {
        //         replacements: [cust,cust,area,area,grad,grad,cate,cate,prod,prod,represent,represent,repUser,repUser],
        //         type: QueryTypes.SELECT
        //     })
        //     .then((dataFil)=>{
        //         console.log(dataFil);
        //         res.send(dataFil);
                
        //     })
        //     .catch((err)=>
        //     console.log(err)
        //     )
        // }
        // else
        // {

            sequelize.query("SELECT * FROM market_plan_pig_irons AS mppi WHERE (mppi.customerId IN (?)) AND (mppi.area IN (REPLACE(?,''',''))) AND (mppi.grade IN (?)) AND (mppi.category IN (?)) AND (mppi.product IN (?)) AND (mppi.representative IN (?))",
            {
                replacements: [cust,area,grad,cate,prod,represent],
                type: QueryTypes.SELECT
            })
            .then((dataFil)=>{
                console.log(dataFil);
                res.send(dataFil);
                
            })
            .catch((err)=>
            console.log(err)
            )
        // }
        
    }
    else{
        const customerId = req.body.customerId;
        const area = req.body.area;
        const grade = req.body.grade;
        const category = req.body.category;
        const product = req.body.product;
        const representative = req.body.representative;
        const phoneNumber = req.body.phoneNumber;
        const meetingDates = req.body.meetingDates;
        const currentRemark = req.body.currentRemark;
        const remarkStatus = req.body.remarkStatus;
        const nextDate = req.body.nextDate;
        const currentIssue = req.body.currentIssue;
        const analysed = req.body.analysed;
        const updateTimeStamp = req.body.updateTimeStamp;
        const totalIssue = req.body.totalIssue;
        marketPlanPigIronModel.create({
            customerId: customerId,
            area: area,
            grade: grade,
            category: category,
            product: product,
            representative: representative,
            phoneNumber: phoneNumber,
            meetingDates: meetingDates,
            currentRemark: currentRemark,
            remarkStatus: remarkStatus,
            nextDate: nextDate,
            currentIssue: currentIssue,
            analysed: analysed,
            updateTimeStamp: updateTimeStamp,
            totalIssue: totalIssue
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
}















const getMarketPlanQuantityLedger =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        if(req.session.role=="Admin")
        {
            marketPlanQuantityLedgerModel.findAll()
            .then((data)=>{
                res.render('marketPlanQuantityLedger')
            })
            .catch((err)=>
                console.log(err)
            )
        }
    }
}
const postMarketPlanQuantityLedger =(req,res,next)=>{
    
}


module.exports = {
    getMarketPlanPigIron,
    postMarketPlanPigIron,
    getMarketPlanQuantityLedger,
    postMarketPlanQuantityLedger
}