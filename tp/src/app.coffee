http = require 'http'
user = require './user'

server = http.createServer (req, res) ->
  user.get 'Tangui', (id) ->
    res.writeHead 200, 'Content-Type': 'text/plain'
    res.end 'hello ' + id
server.listen 1338, '127.0.0.1'
