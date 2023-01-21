const masterAreaModel = require('../model/masterAreaModel');
const masterCategoriesModel = require('../model/masterCategoriesModel');
const masterCustomerModel = require('../model/masterCustomerModel');
const masterEmployeeModel = require('../model/masterEmployeeModel');
const masterGradeModel = require('../model/masterGradeModel');
const masterProductsModel = require('../model/masterProductsModel');
const masterTeamsModel = require('../model/masterTeamsModel');
const masterVendorsModel = require('../model/masterVendorsModel');



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
                level: req.session.userLevel
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
        });
        res.redirect('/masterArea');
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        masterAreaModel.update({
            area: req.body.area
          },
          {
              where: {areaId: req.body.id}
          }
        )
        masterCategoriesModel.update({
            categoriesType: req.body.categoriesType
        },
        {
            where: {categoriesId: req.body.id}
        }
        )
    }
    else
    {
        const area = req.body.area;
        masterAreaModel.create({
            area :area
        })
        .then((result)=>{
            console.log(result),
            console.log('New Master Area added'),
            masterAreaModel.findAll()
            .then((data)=>{
                console.log(data);
                res.render('masterArea',{
                    username : req.session.username,
                    data:data,
                    level:req.session.userLevel
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
    
}

// const getAddMasterArea =(req,res,next)=>{
//     if(req.session.userLevel>2)
//     {
//         if(req.session.isLoggedIn)
//         {
//             res.render('addMasterArea');
//         }
//         else 
//         {
//             res.redirect('/')
//         }
//     }
//     else 
//     {
//         res.redirect('/masterArea');
//     }
    
// }

// const postAddMasterArea = (req,res,next)=>{
//     const area = req.body.area;
//     masterAreaModel.create({
//         area :area
//     })
//     .then((result)=>
//         console.log(result),
//         console.log('New Master Area added'),
//         masterAreaModel.findAll()
//         .then((data)=>{
//             console.log(data);
//             res.render('masterArea',{data:data,level:req.session.userLevel})
//         })
//         .catch((err)=>
//             console.log(err)
//         )
//     )
//     .catch((err)=>
//         console.log(err)
//     )
// } 





















const getMasterCategories =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {

        masterCategoriesModel.findAll()
        .then((data)=>{
            res.render('masterCategories',{
                username : req.session.username,
                data:data,
                level:req.session.userLevel
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
        .then((result)=>
            console.log("kios check"),
            res.redirect('/masterCategories'),
            console.log("kios check2")
        )
        .catch((err)=>
        console.log(err)
    )
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.categoriesType);
        masterCategoriesModel.update({
            categoriesType: req.body.categoriesType
        },
        {
            where: {categoriesId: req.body.id}
        }
        )
    }
    else{
        const categoriesType = req.body.categoriesType;
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
}

// const getAddMasterCategories = (req,res,next)=>{
//     if(req.session.isLoggedIn)
//     {
//         res.render('addMasterCategories');
//     }
//     else 
//     {
//         res.redirect('/')
//     }
// }

// const postAddMasterCategories = (req,res,next)=>{
//     const categoriesType = req.body.categoriesType;
//     masterCategoriesModel.create({
//         categoriesType : categoriesType
//     })
//     .then((result)=>
//         console.log(result),
//         console.log('New Master Category added'),
//         res.redirect('/masterCategories')
//     )
//     .catch((err)=>
//         console.log(err)
//     )
// }
















const getMasterCustomer =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        masterGradeModel.findAll()
        .then((gradeData)=>{
            masterAreaModel.findAll()
            .then((areaData)=>{
                masterCustomerModel.findAll()
                    .then((data)=>{
                        res.render('masterCustomer',
                        {
                            username : req.session.username,
                            data:data,
                            level:req.session.userLevel,
                            gradeData:gradeData,
                            areaData:areaData
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
    }
    
    else if(req.body.op==="edt")
    {

        masterCustomerModel.update({
            customerName: req.body.customerName,
            area: req.body.area,
            status: req.body.status,
            grade: req.body.grade,
            pincode: req.body.pincode,
            address: req.body.address,
            referenceNumber1: req.body.referenceNumber1,
            referenceNumber2: req.body.referenceNumber2,
            creditLimit: req.body.creditLimit,
            creditDays: req.body.creditDays

          },
          {
              where: {customerId: req.body.id}
          }
        )
    }
    else{
        const customerName = req.body.customerName
        const area = req.body.area
        const status = req.body.status
        const grade = req.body.grade
        const pincode = req.body.pincode
        const address = req.body.address
        const referenceNumber1 = req.body.referenceNumber1
        const referenceNumber2 = req.body.referenceNumber2
        const creditLimit = req.body.creditLimit
        const creditDays = req.body.creditDays

        masterCustomerModel.create({
            customerName:customerName,
            area:area,
            status:status,
            grade:grade,
            pincode:pincode,
            address:address,
            referenceNumber1:referenceNumber1,
            referenceNumber2:referenceNumber2,
            creditLimit:creditLimit,
            creditDays:creditDays
        })
        .then((result)=>
            console.log(result),
            console.log('New Master Customer added'),
            res.redirect('/masterCustomer')
        )
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
                    level:req.session.userLevel
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
            gender: req.body.gender,
            photo: req.body.photo

          },
          {
              where: {employeeNumber: req.body.id}
          }
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
        const gender = req.body.gender
        const photo = req.body.photo
    
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
            gender:gender,
            photo:photo
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
}
















const getMasterGrade =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {

        masterGradeModel.findAll()
        .then((data)=>{
            res.render('masterGrade',{
                username : req.session.username,
                data:data,
                level:req.session.userLevel})
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
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.gradeType);
        masterGradeModel.update({
            gradeType: req.body.gradeType
        },
        {
            where: {gradeId: req.body.id}
        }
        )
    }
    else
    {
        const gradeType = req.body.gradeType;
        console.log(`noooooooooooooooooooooooooooooooooooo ${gradeType}`)
        masterGradeModel.create({
            gradeType : gradeType
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
}

















const getMasterProducts =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {

        masterProductsModel.findAll()
        .then((data)=>{
            res.render('masterProducts',{
                username : req.session.username,
                data:data,
                level:req.session.userLevel
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

const postMasterProducts =(req,res,next)=>{
    var id = req.body.id;
    if(req.body.op==="del")
    {
        masterProductsModel.destroy({
            where: { productId : id}
        })
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.productGroup);
        console.log(req.body.id);
        masterProductsModel.update({
            productName: req.body.productName,
            productGroup: req.body.productGroup
        },
        {
            where: {productId: req.body.id}
        }
        )
    }
    else{
        const productName = req.body.productName;
        const productGroup = req.body.productGroup;
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
}

















const getMasterTeams =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        masterTeamsModel.findAll()
                .then((data)=>{
                    res.render('masterTeams',{
                        username : req.session.username,
                        data:data,
                        level:req.session.userLevel
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
const postMasterTeams =(req,res,next)=>{
    var id = req.body.id;
    if(req.body.op==="del")
    {
        masterTeamsModel.destroy({
            where: { teamId : id}
        })
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.teamMember);
        console.log(req.body.teamLeader);
        console.log(req.body.id);
        masterTeamsModel.update({
            teamMember: req.body.teamMember,
            teamLeader: req.body.teamLeader
        },
        {
            where: {teamId: req.body.id}
        }
        )
    }
    else
    {
        const teamMember = req.body.teamMember;
        const teamLeader = req.body.teamLeader;
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
                        level:req.session.userLevel
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
    }
    else if(req.body.op==="edt")
    {
        console.log(req.body.vendorArea);
        console.log(req.body.vendorAddress);
        console.log(req.body.id);
        masterVendorsModel.update({
            vendorAddress: req.body.vendorAddress,
            vendorArea: req.body.vendorArea
        },
        {
            where: {vendorId: req.body.id}
        }
        )
    }
    else
    {
        // const vendorId = req.body.vendorId;
        const vendorAddress = req.body.vendorAddress;
        const area = req.body.area;
        masterVendorsModel.create({
            // vendorId :vendorId,
            vendorAddress :vendorAddress,
            area :area
        }) 
        .then((result)=>
            console.log(result),
            console.log('New Master Vendor added'),
            res.redirect('/masterVendors')
        )
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

    getMasterTeams,
    postMasterTeams,

    getMasterVendors,
    postMasterVendors
    // getAddMasterVendors,
    // postAddMasterVendors
}