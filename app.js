const { response } = require('express');
var express = require('express');
var pgp = require('pg-promise')();
var dbsettings = (process.env.DATABASE_URL || "postgres://postgres:data@localhost:5432/burnup_db");
// var dbsettings = (process.env.DATABASE_URL || "postgres://postgres:@localhost:5432/burnup_db");
const db = pgp(dbsettings);
var bodyParser = require('body-parser');
module.exports = db;

var app = express();
const es6Renderer = require('express-es6-template-engine');
app.engine('html', es6Renderer);
app.set('views', 'views');
app.set('view engine', 'html');

//middleware
app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());
app.use('/public', express.static('public'));

require('dotenv').config();

var PORT = process.env.PORT || 3000;
app.listen(PORT, function () {
  console.log('Listening on port ' + PORT);
});

const { auth, requiresAuth } = require('express-openid-connect');

const config = {
  authRequired: false,
  auth0Logout: true,
  baseURL: process.env.baseURL,
  clientID: process.env.clientID,
  issuerBaseURL: process.env.issuerBaseURL,
  secret: process.env.secret,
};

// auth router attaches /login, /logout, and /callback routes to the baseURL
app.use(auth(config));

// req.isAuthenticated is provided from the auth router
app.get('/',requiresAuth(), (req, res) => { 
  if(req.oidc.isAuthenticated()){
    res.redirect("/index");
    // res.redirect("/index.js");
  }
});

app.get('/index', async (request, response, next) => {
  try{
      var getWorkoutsQuery = await db.query("SELECT * FROM workouts");
      response.render("index", {locals: {result: getWorkoutsQuery}, partials: {}}); 
      
  } catch(error) {
      console.log(error+"catch statement");
      next(error)
      response.send({
        error,
        msg: "There was an error with the database trying to retrieve the workout names."
      })
  }   
});

app.post('/submitworkout', async(request,response,next)=>{
      var submittedForm = request.body;
      var userInfo = request.oidc.user;
      var userID = await db.query(`SELECT user_id FROM users WHERE email = '${userInfo.email}'`);
      var d = submittedForm.date_schedule.toString();
     try{
      console.log(userID[0]);
      if(userID[0]===undefined)
      {
        var addUserQuery= await db.query(`INSERT INTO users(name,last_name,email)VALUES('${userInfo.given_name}','${userInfo.family_name}','${userInfo.email}')`);
        var userID = await db.query(`SELECT user_id FROM users WHERE email = '${userInfo.email}'`);
      }
      
      // console.log(submittedForm.workout_id.length); 
      
      for(var i = 0;i<submittedForm.workout_id.length;i++)
      {    
        if(Array.isArray(submittedForm.workout_id)){
      await db.query(`INSERT INTO scheduled_workouts(weekday,date_schedule,completed,workout_id,user_id)VALUES('${submittedForm.weekday}','${d}',false,${submittedForm.workout_id[i]},${userID[0].user_id})`);
    }
    else{
      await db.query(`INSERT INTO scheduled_workouts(weekday,date_schedule,completed,workout_id,user_id)VALUES('${submittedForm.weekday}','${d}',false,${submittedForm.workout_id},${userID[0].user_id})`);
    }
       }

    } 
    catch(error){
      next(error)
      response.send({
        error,
        msg: "There was an error with the database trying to add workouts."
      })

    }
      // await db.query(`INSERT INTO scheduled_workouts(weekday,date_schedule,completed,workout_id,user_id)VALUES('Monday',${1},True,2,1)`);
});

app.get('/profile', requiresAuth(), (req, res) => {
  res.send(JSON.stringify(req.oidc.user));
  });


app.get('/complete', requiresAuth(), async (req, res, next)=>{
  try{
    res.render("complete");
    // var getScheduledWorkoutsQuery = await db.query("SELECT * FROM scheduled_workouts"); //search for all workouts for one day to check off
    // res.render("complete", {locals: {result: getScheduledWorkoutsQuery}, partials: {}});
  }catch{
    console.log(error+"catch statement");
      next(error)
      response.send({
        error,
        msg: "Error with complete page"
      })

  }
});

