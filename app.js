var express = require('express');

var pgp = require('pg-promise')();
const db = pgp("postgres://postgres:data@localhost:5432/test");
var app = express();
const es6Renderer = require('express-es6-template-engine');
app.engine('html', es6Renderer);
app.set('views', 'views');
app.set('view engine', 'html');

//middleware
app.use(express.urlencoded({extended:true}));
app.use('/public', express.static('public'));

app.get('/', (request, response) => {
  response.render("login");
});

require('dotenv').config();

app.get('/index.html', async (request, response, next) => {
    try{
        var dbQuery = await db.query("SELECT * FROM restaurant");
        response.send({message:'hello', result: dbQuery});
        response.render("week-view"); //whatever the main html file is called
    } catch(error) {
        console.log(error+"catch statement");
        next(error)
        response.send({
          error,
          msg: "There was an error with the database."
        })
    }   
});

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
app.get('/', (req, res) => {
  res.send(req.oidc.isAuthenticated() ? 'Logged in' : 'Logged out')
});

app.get('/profile',requiresAuth(), (req, res)=>{
  res.send(JSON.stringify(req.oidc.user));
});