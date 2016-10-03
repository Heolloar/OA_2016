var http = require('http');
var user = require('./user.js');

http.createServer(function (req, res)
{
  user.get("Tangui", function(id)
  {
    res.writeHead(200,{'Content-Type': 'text/plain'})
    res.end("hello " + id);
  })

}).listen(1337,'127.0.0.1');
