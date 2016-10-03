var http = require('http')
var user = require('./user.js')

http.creatServer(function (req, res)
{
  user.get("cesar", function(id)
  {
    res.writeHead(200,{'Content-Type': 'text/plain'})
    res.end("hello " + id);
  })
  
}).listen(1337,'127.0.0.1');
