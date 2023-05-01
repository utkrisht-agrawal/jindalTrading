const vendorContactModel = require('../model/vendorContactModel');
const masterVendorsModel = require('../model/masterVendorsModel');

const getVendorContacts =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        masterVendorsModel.findAll()
        .then((vendorData)=>{
            vendorContactModel.findAll()
            .then((data)=>{
                console.log(data);
                res.render('vendorContact',{
                    username : req.session.username,
                    data:data,
                    vendorData:vendorData,
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
    }
    else 
    {
        res.redirect('/')
    }
}

const postVendorContacts =(req,res,next)=>{
    console.log(`check1 ${req.body.id}`);
    console.log(`check2 ${req.body.category}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        vendorContactModel.destroy({
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
        console.log("new yr");
        vendorContactModel.update({
            vendorName: req.body.vendorName,
            mobileNumber: req.body.mobileNumber,
            designation :req.body.designation,
            email :req.body.email
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
    else
    {
        vendorContactModel.create({
            vendorName :req.body.vendorName,
            mobileNumber :req.body.mobileNumber,
            designation :req.body.designation,
            email :req.body.email
        })
        .then((result)=>{
            console.log(result),
            vendorContactModel.findAll()
            .then((data)=>{
                console.log(data);
                res.redirect('/vendorContacts');
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
    getVendorContacts,
    postVendorContacts
}