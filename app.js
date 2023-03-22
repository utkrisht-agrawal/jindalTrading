const express = require('express'); 
const bodyParser = require('body-parser');
const session = require('express-session');
const flash = require('req-flash');
const path = require('path');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname,'public')))      
app.use(session({secret: 'my secret',resave: false, saveUninitialized: false}));
app.use(flash());

app.set("view engine","ejs"); 
app.set("views","./views");

const sequelize = require('./database/connect');
const userRoutes = require('./routes/userRoutes');
const masterRoutes = require('./routes/masterRoutes');
const customerRoutes = require('./routes/customerRoutes');
const transportRoutes = require('./routes/transportRoutes');
const marketPlanRoutes = require('./routes/marketPlanRoutes');



app.use(userRoutes);
app.use(masterRoutes);
app.use(customerRoutes);
app.use(transportRoutes);
app.use(marketPlanRoutes);

app.use('/',(req,res,next)=>{
    console.log(req.session);
    res.render('index',
    {data : req.session.isLoggedIn}
    );
});



const port = process.env.PORT || 3000;

sequelize.sync()
    .then(result => {
        app.listen(port,()=>{
            console.log(`Server is running at port no ${port}`);
        });
    })
    .catch(err =>{
        console.log(err);
    });
