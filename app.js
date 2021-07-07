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

var PORT = process.env.PORT || 8000;
app.listen(PORT, function () {
  console.log('Listening on port ' + PORT);
});