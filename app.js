const express = require('express'); 
const bodyParser = require('body-parser');
const session = require('express-session');
const path = require('path');

const sequelize = require('./database/connect');
const userRoutes = require('./routes/userRoutes');
const masterRoutes = require('./routes/masterRoutes');
const marketPlanRoutes = require('./routes/marketPlanRoutes');

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname,'public')))
app.use(session({secret: 'my secret',resave: false, saveUninitialized: false}));


app.set("view engine","ejs"); 
app.set("views","./views");

app.use(userRoutes);
app.use(masterRoutes);
app.use(marketPlanRoutes);

app.use('/',(req,res,next)=>{
    console.log(req.session);
    res.render('home',
    {data : req.session.isLoggedIn}
    );
});

sequelize.sync()
    .then(result => {
        app.listen(port,()=>{
            console.log(`Server is running at port no ${port}`);
        });
    })
    .catch(err =>{
        console.log(err);
    });
