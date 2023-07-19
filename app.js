const express = require('express'); 
const bodyParser = require('body-parser');
const session = require('express-session');
const path = require('path');
const multer = require('multer');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname,'public')))      
app.use('/images',express.static(path.join(__dirname,'images')))      
app.use(session({secret: 'my secret',resave: false, saveUninitialized: false}));



const fileStorage = multer.diskStorage({
  destination: (req,file,cb) =>{
    cb(null,'images');
  },
  filename:(req,file,cb)=>{
    cb(null,new Date().toISOString().replace(/:/g, '-')+'-'+file.originalname)
  }
})

const fileFilter = (req,file,cb)=>{
  if(file.mimetype === 'image/png' || file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg')
  {
    cb(null,true)
  }else{
    cb(null,false)
  }
}



app.set("view engine","ejs"); 
app.set("views","./views");

const sequelize = require('./database/connect');
const userRoutes = require('./routes/userRoutes');
const masterRoutes = require('./routes/masterRoutes');
const customerRoutes = require('./routes/customerRoutes');
const transportRoutes = require('./routes/transportRoutes');
const vendorRoutes = require('./routes/vendorRoutes');
const marketPlanRoutes = require('./routes/marketPlanRoutes');
const contactRoutes = require('./routes/contactRoutes');


app.use(multer({ storage : fileStorage,fileFilter: fileFilter}).single('photo'))

app.use(userRoutes);
app.use(masterRoutes);
app.use(customerRoutes);
app.use(transportRoutes);
app.use(vendorRoutes);
app.use(marketPlanRoutes);
app.use(contactRoutes);

app.use('/',(req,res,next)=>{
    console.log(req.session);
    res.render('index',{
      data:req.session.isLoggedIn
    });
});

  



const port = process.env.PORT || 80;

sequelize.sync()
    .then(result => {
        app.listen(port,()=>{
            console.log(`Server is running at port no ${port}`);
        });
    })
    .catch(err =>{
        console.log(err);
    });
