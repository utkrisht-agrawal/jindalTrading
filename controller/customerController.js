const customerContactModel = require('../model/customerContactModel');
const customerCategoryModel = require('../model/customerCategoryModel');
const customerFirmModel = require('../model/customerFirmModel');
const customerProductModel = require('../model/customerProductModel');
const masterProductsModel = require('../model/masterProductsModel');
const masterCustomerModel = require('../model/masterCustomerModel');
const masterFirmModel = require('../model/masterFirmModel');
const masterCategoriesModel = require('../model/masterCategoriesModel');



const getmasterFirm =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        console.log(`User Level :  ${req.session.userLevel}`);
        masterFirmModel.findAll()
            .then((data)=>{
                console.log(data);
                res.render('masterFirm',{
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

const getmasterFirmApi =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        console.log(`User Level :  ${req.session.userLevel}`);
        masterFirmModel.findAll()
            .then((data)=>{
                console.log(data);
                res.json(data )
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

const postmasterFirm = async (req,res,next)=>{
    console.log(`check1 ${req.body.id}`);
    console.log(`check2 ${req.body.op}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        customerFirmModel.findAll(
            {
                where:{firm:id}
            }
        )
        .then((data)=>{
            console.log(data)
            console.log(data.length)
            if(data.length===0)
            {
                console.log("A")
                masterFirmModel.destroy({
                    where: { firmId : id}
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
                console.log("B")
                res.send("present")
            }
        })
        .catch(err=>{console.log(err)})
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        masterFirmModel.update({
            firmName: req.body.firmName,
            address: req.body.address,
            pincode: req.body.pincode,
            GSTNumber: req.body.GSTNumber,
            accountNumber: req.body.accountNumber,
            bankName: req.body.bankName,
            IFSCcode: req.body.IFSCcode,
            ProductProduced: req.body.ProductProduced,
            Quantity: req.body.Quantity
          },
          {
              where: {firmId: req.body.id}
          }
        )
        .then((qwe)=>{
            res.send("kyu")
        })
        .catch((err)=>{
            console.log(err);
        })
    }
    else if(req.body.op=="addFirm")
    { 

        console.log("modal firm")
        console.log(req.body.data)
        var dataString = req.body.data
        const keyValuePairs = dataString.split('&').map(pair => pair.split('='));
        console.log("dataString11111111111111111111111", dataString)
        console.log("here is the keyValuePairs11111111111111111",keyValuePairs)
        let firmName, address, pincode, GSTNumber, accountNumber, bankName, IFSCcode, ProductProduced, Quantity;

        keyValuePairs.forEach(pair => {
        const key = pair[0];
        const value = pair[1];
        switch (key) {
            case "firmName":
            firmName = value;
            break;
            case "address":
            address = value;
            break;
            case "pincode":
            pincode = value;
            break;
            case "GSTNumber":
            GSTNumber = value;
            break;
            case "accountNumber":
            accountNumber = value;
            break;
            case "bankName":
            bankName = value;
            break;
            case "IFSCcode":
            IFSCcode = value;
            break;
            case "ProductProduced":
            ProductProduced = value;
            break;
            case "Quantity":
            Quantity = value;
            break;      
            default:
            // Handle any other keys here if necessary
            break;
        }
        });


        try {
            // Check if firm exists
            const existingFirms = await masterFirmModel.findOne({
                  where: {
                      GSTNumber: GSTNumber,
                  },
                });
        
            if (existingFirms) {

              const Firms = await masterFirmModel.findAll()
              res.send({msg : "Firm Already Exist" , result : Firms})

            } else {
              let result = await masterFirmModel.create({
                  firmName: firmName,
                  address: address,
                  pincode: pincode,
                  GSTNumber: GSTNumber,
                  accountNumber: accountNumber,
                  bankName: bankName,
                  IFSCcode: IFSCcode,
                  ProductProduced: ProductProduced,
                  Quantity: Quantity,
              });
          
              console.log("result", result);
          
              if (result) {
                
                  const Firms = await masterFirmModel.findAll();
                  console.log("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss" , Firms)
                  res.send({ msg: "New Firm Created", result: Firms });
              }
            }
          } catch (error) {
            console.error("Error creating firm:", error);
            // Handle the error accordingly
            msg = "Error creating firm";
          }
        

       
    }
    else
    {
         
        masterFirmModel.create({
            firmName: req.body.firmName,
            address: req.body.address,
            pincode: req.body.pincode,
            GSTNumber: req.body.GSTNumber,
            accountNumber: req.body.accountNumber,
            bankName: req.body.bankName,
            IFSCcode: req.body.IFSCcode,
            ProductProduced: req.body.ProductProduced,
            Quantity: req.body.Quantity
        })
        .then((result)=>{
            console.log(result),
            masterFirmModel.findAll()
            .then((updatedFirmData) => {
                res.render('masterFirm',{
                    username : req.session.username,
                    data:updatedFirmData,
                    level: req.session.userLevel                    
                })
                // res.json({ firmData: updatedFirmData }); // Return the updated firm data in the response
            })
            .catch((err) => {
                console.log(err);
                res.status(500).json({ error: "Failed to fetch updated firm data" });
            });
        })
        .catch((err)=>
            console.log(err)
        )
    }
    
}














const getCustomerContact =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        console.log(`User Level :  ${req.session.userLevel}`);
        masterCustomerModel.findAll()
        .then((custData)=>{
            customerContactModel.findAll()
            .then((data)=>{
                console.log(data);
                res.render('customerContact',{
                    username : req.session.username,
                    data:data,
                    level: req.session.userLevel,
                    custData:custData
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

const postCustomerContact =(req,res,next)=>{
    console.log(`check1 ${req.body.id}`);
    console.log(`check2 ${req.body.op}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        customerContactModel.destroy({
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
        console.log("new yr");
        customerContactModel.update({
            designation: req.body.designation,
            mobileNumber: req.body.mobileNumber,
            email: req.body.email,
            ...(req.body.customerName !== "null" && { customerName: req.body.customerName })
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
    else
    {
        const customerName = req.body.customerName
        const contacts = req.body.contact || null
        const contactNames = req.body.contactName
        const designations = req.body.designation
        const emails = req.body.email
        
        if(contacts)
        {
            console.log(contactNames)
            console.log(contacts)
            console.log(designations)
            console.log(emails)
            for (let i = 0; i < contacts.length; i++) {
                const contactName = contactNames[i];
                const contact = contacts[i];
                const designation = designations[i];
                const email = emails[i];
            
                customerContactModel
                .create({
                    customerName: customerName,
                    mobileNumber: contact,
                    contactName: contactName,
                    designation: designation,
                    email: email,
                })
                .then((res2) => {
                    console.log(res2);
                })
                .catch((err) => {
                    console.log(err);
                });
            }
        }
        res.redirect('/customerContact')
    }
    
}

















const getCustomerCategory =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        console.log(`User Level :  ${req.session.userLevel}`);
        masterCustomerModel.findAll()
        .then((custData)=>{
            masterCategoriesModel.findAll()
            .then((categorydata)=>{
                customerCategoryModel.findAll()
                .then((data)=>{
                    console.log(data);
                    res.render('customerCategory',{
                        username : req.session.username,
                        data:data,
                        custData: custData,
                        categorydata: categorydata,
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
        res.redirect('/')
    }
}


const postCustomerCategory =(req,res,next)=>{
    console.log(`check1 ${req.body.customerName}`);
    console.log(`check2 ${req.body.category}`);
    const id = req.body.id;
    console.log(`check3  ${id}`);
    if(req.body.op==="del")
    {
        customerCategoryModel.destroy({
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
        console.log("new yr");
        customerCategoryModel.update({
            ...(req.body.customerName !== "null" && { customerName: req.body.customerName }),
            ...(req.body.category !== "null" && { category: req.body.category })

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

        masterCustomerModel.findAll()
        .then((custData)=>{
            masterFirmModel.findAll()
            .then((firmData)=>{
                customerFirmModel.findAll()
                .then((data)=>{
                    console.log(data);
                    res.render('customerFirm',{
                        username : req.session.username,
                        data:data,
                        firmData:firmData,
                        level: req.session.userLevel,
                        custData: custData
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


const postCustomerFirm =(req,res,next)=>{
    console.log(`check1 ${req.body.customerName}`);
    console.log(`check2 ${req.body.firm}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        customerFirmModel.destroy({
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
        console.log("new yr");
        customerFirmModel.update({
            ...(req.body.customerName !== "null" && { customerName: req.body.customerName }),
            ...(req.body.firm !== "null" && { firm: req.body.firm })

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

        masterCustomerModel.findAll()
        .then((custData)=>{
            masterProductsModel.findAll()
            .then((prodData)=>{
                customerProductModel.findAll()
                .then((data)=>{
                    console.log(data);
                    res.render('customerProduct',{
                        username : req.session.username,
                        data:data,
                        custData:custData,
                        prodData:prodData,
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
        customerProductModel.update({
            ...(req.body.customerName !== "null" && { customerName: req.body.customerName }),
            ...(req.body.product !== "null" && { product: req.body.product })
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
    getmasterFirm,
    postmasterFirm,
    getCustomerContact,
    postCustomerContact,
    getCustomerCategory,
    postCustomerCategory,
    getCustomerFirm,
    postCustomerFirm,
    getCustomerProduct,
    postCustomerProduct,
    getmasterFirmApi
}