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
    res.redirect("/index.js");
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
  try{
      console.log(request.body);
  }
  catch{

  }
})

app.get('/profile',requiresAuth(), (req, res)=>{
  try{
  res.render("index", {locals:{result:JSON.stringify(req.oidc.user)}, partials:{}});
}catch{
  console.log(error+"catch statement");
      next(error)
      response.send({
        error,
        msg: "Error with user profile."
      })

}
});
