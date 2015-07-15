class SocketIO
  constructor: (server) ->
    @io = require 'socket.io'
      .listen server
  register: () ->
    @io.sockets.on 'connection', (socket) =>
    	@io.sockets.emit 'blast', { msg:"someone connected" }
    	socket.on 'blast', (data, fn) =>
    		console.log data
    		@io.sockets.emit 'blast', { msg:data.msg }
    		fn()

module.exports = SocketIO
