var express = require('express');
var app = express();

var port = 4567;
var service = "D";
var version = "2.0.0";

app.get('/', function(req, res) {
    console.log("Someone is requesting access to version: " + version + " of service " + service);
    res.json({
    	"service": service,
    	"version": version
    });
});

app.listen(port, function() {
       	console.log("Server listening on port " + port);
});
