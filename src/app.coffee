http = require "http"
express = require "express"
morgan = require('morgan') ('dev')
errorhandler = require 'errorhandler'
bodyparser = require 'body-parser'
urlencodedParser = bodyparser.urlencoded({ extended: false });
cookieParser = require 'cookie-parser'
methodOverride = require 'method-override'
user = require "./users"
app = express()
metrics = require './metrics'

if process.env.NODE_ENV == 'development'
  #only use in development
  app.use(errorhandler())

session = require 'express-session'
LevelStore = require('level-session-store')(session)

#configuration of session db
app.use session
  secret: 'TopSecret'
  store: new LevelStore './db/sessions'
  resave: true
  saveUninitialized: true

#display requests
app.use morgan

app.use bodyparser.json()
app.use bodyparser.urlencoded()
app.use cookieParser()
app.use methodOverride 'X-HTTP-Method-Override'

app.set 'port', 1337
app.set 'view engine', 'pug'
app.set 'views', "#{__dirname}/../views"

app.use '/', express.static "#{__dirname}/../public"
app.use '/bower_components',  express.static "#{__dirname}/../bower_components"

app.use require('./routes/auth.coffee') express.Router()
app.use require('./routes/users.coffee') express.Router()
#app.use require('./routes/user-metrics.coffee') express.Router()

app.get '/metricstest', (req, res) ->
  name = req.body.name
  console.log name
  metrics.gettest (err, data) ->
  	throw next err if err
  	res.status(200).json data

app.get '/metricstest.json', (req, res) ->
  name = req.body.name
  console.log "name"
  console.log name
  metrics.gettest (err, data) ->
    throw next err if err
    res.status(200).json data

app.post "/metrics/:id", (req, res) ->
  console.log req
  metrics.save req.params.id, req.body, (err) ->
    throw next err if err
    res.status(200).send()

app.post '/todo/ajouter/', urlencodedParser, (req, res) ->
  metrics.save req.params.id, req.body, (err) ->
    throw next err if err
    res.status(200).send()
    
app.post "/metrics/:id", urlencodedParser, (req, res) ->
  metrics.save req.params.id, req.body, (err) ->
    throw next err if err
    res.status(200).send()    

app.post "/insert", urlencodedParser, (req, res) ->
  name = req.body.name
  value = req.body.value
  metrics.save name, value, (err) ->
    throw next err if err
    res.status(200).send()

app.listen app.get('port'), ->
  console.log "listening on port #{app.get 'port'}"
