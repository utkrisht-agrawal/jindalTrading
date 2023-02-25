const customerContactModel = require('../model/customerContactModel');
const customerCategoryModel = require('../model/customerCategoryModel');
const customerFirmModel = require('../model/customerFirmModel');
const customerProductModel = require('../model/customerProductModel');
const masterCustomerModel = require('../model/masterCustomerModel');



const getCustomerContact =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        console.log(`User Level :  ${req.session.userLevel}`);
        customerContactModel.findAll()
            .then((data)=>{
                console.log(data);
                res.render('customerContact',{
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

const postCustomerContact =(req,res,next)=>{
    console.log(`check1 ${req.body.id}`);
    console.log(`check2 ${req.body.op}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        customerContactModel.destroy({
            where: { customerId : id}
        });
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        customerContactModel.update({
            customerName: req.body.customerName,
            mobileNumber: req.body.mobileNumber
          },
          {
              where: {customerId: req.body.id}
          }
        )
    }
    else
    {
        const customerName = req.body.customerName;
        const mobileNumber = req.body.mobileNumber;
        customerContactModel.create({
            customerName :customerName,
            mobileNumber :mobileNumber
        })
        .then((result)=>{
            console.log(result),
            res.redirect('/customerContact')
        })
        .catch((err)=>
            console.log(err)
        )
    }
    
}
const getCustomerCategory =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        console.log(`User Level :  ${req.session.userLevel}`);
        customerCategoryModel.findAll()
        .then((data)=>{
            console.log(data);
            res.render('customerCategory',{
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


const postCustomerCategory =(req,res,next)=>{
    console.log(`check1 ${req.body.customerName}`);
    console.log(`check2 ${req.body.category}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        customerCategoryModel.destroy({
            where: { customerId : id}
        });
        res.redirect('/customerCategory');
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        customerCategoryModel.update({
            customerName: req.body.customerName,
            category: req.body.category
          },
          {
              where: {customerId: req.body.id}
          }
        )
    }
    else
    {
        const customerName = req.body.customerName;
        const category = req.body.category;
        customerCategoryModel.create({
            customerName :customerName,
            category :category
        })
        .then((result)=>{
            console.log(result),
            res.redirect('/customerCategory')
        })
        .catch((err)=>
            console.log(err)
        )
    }
    
}










const getCustomerFirm =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        console.log(`User Level :  ${req.session.userLevel}`);
        customerFirmModel.findAll()
        .then((data)=>{
            console.log(data);
            res.render('customerFirm',{
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


const postCustomerFirm =(req,res,next)=>{
    console.log(`check1 ${req.body.customerName}`);
    console.log(`check2 ${req.body.firm}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        customerFirmModel.destroy({
            where: { customerId : id}
        });
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        customerFirmModel.update({
            customerName: req.body.customerName,
            firm: req.body.firm
          },
          {
              where: {customerId: req.body.id}
          }
        )
    }
    else
    {
        const customerName = req.body.customerName;
        const firm = req.body.firm;
        customerFirmModel.create({
            customerName :customerName,
            firm :firm
        })
        .then((result)=>{
            console.log(result),
            res.redirect('/customerFirm')
        })
        .catch((err)=>
            console.log(err)
        )
    }
    
}












const getCustomerProduct =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        console.log(`User Level :  ${req.session.userLevel}`);
        customerProductModel.findAll()
        .then((data)=>{
            console.log(data);
            res.render('customerProduct',{
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


const postCustomerProduct =(req,res,next)=>{
    console.log(`check1 ${req.body.customerName}`);
    console.log(`check2 ${req.body.product}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        customerProductModel.destroy({
            where: { customerId : id}
        });
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        customerProductModel.update({
            customerName: req.body.customerName,
            product: req.body.product
          },
          {
              where: {customerId: req.body.id}
          }
        )
        
    }
    else
    {
        const customerName = req.body.customerName;
        const product = req.body.product;
        customerProductModel.create({
            customerName :customerName,
            product :product
        })
        .then((result)=>{
            console.log(result),
            res.redirect('/customerProduct')
        })
        .catch((err)=>
            console.log(err)
        )
    }
    
}











module.exports = {
    getCustomerContact,
    postCustomerContact,
    getCustomerCategory,
    postCustomerCategory,
    getCustomerFirm,
    postCustomerFirm,
    getCustomerProduct,
    postCustomerProduct
}