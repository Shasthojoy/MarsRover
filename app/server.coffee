# server.coffee

# BASE SETUP
# =============================================================================

# call the packages we need
express = require 'express'
app = express()
server = require 'http'
	.createServer app
bodyParser = require 'body-parser'
io = require 'socket.io'
	.listen(server)
device = require 'express-device'

app.use express.static __dirname + 'content'
app.use express.static __dirname + 'scripts'

#set the view engine
app.set 'view engine', 'ejs'
app.set 'views', __dirname + '/views'

app.use device.capture()

# configure app to use bodyParser()
# this will let us get the data from a POST
app.use bodyParser.urlencoded { extended: true }
app.use bodyParser.json()

# set our port
port = process.env.PORT || 8080

# Socket.IO stuff
io.sockets.on 'connection', (socket) ->
	io.sockets.emit 'blast', { msg:"someone connected" }
	socket.on 'blast', (data, fn) ->
		console.log data
		io.sockets.emit 'blast', { msg:data.msg }
		fn()


router = express.Router()
router.get '/', (req, res) ->
	res.render 'index', {}

apiRouter = express.Router()
apiRouter.get '/', (req, res) ->
	res.json { message: 'hooray! welcome to our api!' }

blahRouter = express.Router()
blahRouter.get '/blah', (req, res) ->
	res.json { message: 'blah! welcome to our api!' }


# REGISTER OUR ROUTES -------------------------------
# all of our routes will be prefixed with /api
BearsController = require './controllers/bears-controller'
app.use '/api', new BearsController()
app.use '/api', apiRouter
app.use '/api', blahRouter
app.use '/', router

# START THE SERVER
# =============================================================================
server.listen port
console.log 'Magic happens on port ' + port
