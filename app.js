var express = require('express');
var app = express();
app.listen(3000);
console.log("App listening on port 3000");

// respond with "hello world" when a GET request is made to the homepage
app.get('/', function (req, res){
  res.send('hello world');
});

app.post('/', function (req, res){
  res.send('POST request to the homepage');
});
