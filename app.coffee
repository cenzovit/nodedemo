#module dependencies
express = require 'express'
stylus = require 'stylus'

#start express server 
app = exports.app = express()

#configure server
# compile stylus to css
compile = (str, path) ->
  stylus(str).set('filename', path)

app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use stylus.middleware { 
      src: __dirname + '/public',
      compile: compile
  }
  app.use express.static __dirname + '/public'

#include routes
routes = require './routes/routes'

app.get '/', routes.index

app.listen 3000
console.log "listening on port 3000..."
