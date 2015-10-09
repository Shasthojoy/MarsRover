class SocketIO
  constructor: (server) ->
    @io = require 'socket.io'
      .listen server
  register: () ->
    # usernames which are currently connected to the chat
    usernames = {}
    numUsers = 0
    @io.on 'connection', (socket) ->
      addedUser = false
      # when the client emits 'new message', this listens and executes
      socket.on 'move', (data) ->
        # we tell the client to execute 'new message'
        socket.broadcast.emit 'move',
          username: socket.username
          message: data
        return
      # when the client emits 'add user', this listens and executes
      socket.on 'add user', (username) ->
        # we store the username in the socket session for this client
        socket.username = username
        # add the client's username to the global list
        usernames[username] = username
        ++numUsers
        addedUser = true
        socket.emit 'login', numUsers: numUsers
        # echo globally (all clients) that a person has connected
        socket.broadcast.emit 'user joined',
          username: username
          numUsers: numUsers
        return

      # when the client emits 'stop typing', we broadcast it to others
      socket.on 'blast', ->
        socket.broadcast.emit 'blast', username: socket.username
        return
      # when the user disconnects.. perform this
      socket.on 'disconnect', ->
        # remove the username from global usernames list
        if addedUser
          delete usernames[socket.username]
          --numUsers
          # echo globally that this client has left
          socket.broadcast.emit 'user left',
            username: socket.username
            numUsers: numUsers
        return
      return

    @io.sockets.on 'connection', (socket) =>
    	@io.sockets.emit 'login', { msg:"someone connected" }
    	socket.on 'blast', (data, fn) =>
    		console.log data
    		@io.sockets.emit 'blast', { msg:data.msg }
    		fn()


module.exports = SocketIO
