const customerContactModel = require('../model/customerContactModel');
const customerCategoryModel = require('../model/customerCategoryModel');
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
    console.log(`check3 ${req.body.area}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        customerContactModel.destroy({
            where: { customerId : id}
        });
        res.redirect('/customerContact');
        
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
            customerContactModel.findAll()
            .then((data)=>{
                console.log(data);
                res.render('customerContact',{
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
            Category: req.body.category
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
            customerCategoryModel.findAll()
            .then((data)=>{
                console.log(data);
                res.render('customerCategory',{
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











module.exports = {
    getCustomerContact,
    postCustomerContact,
    getCustomerCategory,
    postCustomerCategory

}