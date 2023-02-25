const transportDetailModel = require('../model/transportDetailModel');
const transportContactModel = require('../model/transportContactModel');
const transportStationModel = require('../model/transportStationModel');
const transportTruckModel = require('../model/transportTruckModel');

const masterAreaModel = require('../model/masterAreaModel');



const getTransportDetails =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        console.log(`User Level :  ${req.session.userLevel}`);
        transportDetailModel.findAll()
        .then((data)=>{
            console.log(data);
            res.render('transportDetail',{
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

const postTransportDetails =(req,res,next)=>{
    console.log(`check1 ${req.body.id}`);
    console.log(`check2 ${req.body.op}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        transportDetailModel.destroy({
            where: { transportId : id}
        })
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        transportDetailModel.update({
            transportName: req.body.transportName,
            transportArea: req.body.transportArea,
            transportStation: req.body.transportStation,
            transportOwner: req.body.transportOwner,
            bankName: req.body.bankName,
            bankAccountNumber: req.body.bankAccountNumber,
            ifscCode: req.body.ifscCode
          },
          {
              where: {transportId: req.body.id}
          }
        );
    }
    else
    {
        transportDetailModel.create({
            transportName :req.body.transportName,
            transportArea :req.body.transportArea,
            transportStation :req.body.transportStation,
            transportOwner :req.body.transportOwner,
            bankName :req.body.bankName,
            bankAccountNumber :req.body.bankAccountNumber,
            ifscCode :req.body.ifscCode
        })
        .then((result)=>{
            console.log(result),
            transportContactModel.create({
                transportName :req.body.transportName,
                transportContact :req.body.transportContact
            })
            .then((res2)=>{
                console.log(res2);
                transportStationModel.create({
                    transportName :req.body.transportName,
                    transportSource :req.body.transportSource,
                    transportDestination :req.body.transportDestination                  
                })
                .then((res3)=>{
                    transportTruckModel.create({
                        transportName :req.body.transportName,
                        transportTruck :req.body.transportTruck                       
                    })
                    .then((res4)=>{
                        console.log(res4)
                        res.redirect('/transportDetails')

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





const getTransportContacts =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        console.log(`User Level :  ${req.session.userLevel}`);
        transportContactModel.findAll()
        .then((data)=>{
            console.log(data);
            res.render('transportContact',{
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


const postTransportContacts =(req,res,next)=>{
    console.log(`check1 ${req.body.id}`);
    console.log(`check2 ${req.body.category}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        transportContactModel.destroy({
            where: { transportId : id}
        });
        
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        transportContactModel.update({
            transportName: req.body.transportName,
            transportContact: req.body.transportContact
          },
          {
              where: {transportId: req.body.id}
          }
        );
        res.redirect('/transportContacts');
    }
    else
    {
        transportContactModel.create({
            transportName :req.body.transportName,
            transportContact :req.body.transportContact
        })
        .then((result)=>{
            console.log(result),
            transportContactModel.findAll()
            .then((data)=>{
                console.log(data);
                res.redirect('/transportContacts');
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










const getTransportStations =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        console.log(`User Level :  ${req.session.userLevel}`);
        transportStationModel.findAll()
        .then((data)=>{
            console.log(data);
            res.render('transportStation',{
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


const postTransportStations =(req,res,next)=>{
    console.log(`check1 ${req.body.transportName}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        transportStationModel.destroy({
            where: { transportId : id}
        });
        
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        transportStationModel.update({
            transportName: req.body.transportName,
            transportSource: req.body.transportSource,
            transportDestination: req.body.transportDestination
          },
          {
              where: {transportId: req.body.id}
          }
        )
    }
    else
    {
        const transportName = req.body.transportName;
        const transportSource = req.body.transportSource;
        const transportDestination = req.body.transportDestination;
        transportStationModel.create({
            transportName :transportName,
            transportSource :transportSource,
            transportDestination :transportDestination
        })
        .then((result)=>{
            console.log(result),
            transportStationModel.findAll()
            .then((data)=>{
                console.log(data);
                res.redirect('/transportStations');
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












const getTransportTrucks =(req,res,next)=>{
    if(req.session.isLoggedIn)
    {
        
        console.log(`User Level :  ${req.session.userLevel}`);
        transportTruckModel.findAll()
        .then((data)=>{
            console.log(data);
            res.render('transportTruck',{
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


const postTransportTrucks =(req,res,next)=>{
    console.log(`check1 ${req.body.transportId}`);
    const id = req.body.id;
    if(req.body.op==="del")
    {
        transportTruckModel.destroy({
            where: { transportId : id}
        });
        
    }
    else if(req.body.op==="edt")
    {
        console.log("new yr");
        transportTruckModel.update({
            transportName: req.body.transportName,
            transportTruck: req.body.transportTruck
          },
          {
              where: {transportId: req.body.id}
          }
        )
        
    }
    else
    {
        const transportName = req.body.transportName;
        const transportTruck = req.body.transportTruck;
        transportTruckModel.create({
            transportName :transportName,
            transportTruck :transportTruck
        })
        .then((result)=>{
            console.log(result),
            transportTruckModel.findAll()
            .then((data)=>{
                console.log(data);
                res.redirect('/transportTrucks')
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
    getTransportDetails,
    postTransportDetails,
    getTransportContacts,
    postTransportContacts,
    getTransportStations,
    postTransportStations,
    getTransportTrucks,
    postTransportTrucks
}