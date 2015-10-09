class Game
  io = require 'socket.io'
  @player = null
  @users = {}
  @cursors = null
  @socket = null
  @username = Math.floor Math.random()*100000

  create: ->
    @game.world.setBounds 0, 0, 1041, 642
    x = @game.width / 2
    y = @game.height / 2
    @add.sprite 0, 0, 'bg'
    @player = @add.sprite x, y, 'player'
    @game.camera.follow @player
    #@player.anchor.setTo 0.5, 0.5
    @cursors = @game.input.keyboard.createCursorKeys()
    @input.onDown.add @onInputDown, this
    @socket = io.connect('http://127.0.0.1:3000/')
    @socket.emit "add user", {@username}, (data) ->
      console.log "logged in"
    @socket.on "user joined", (data) =>
      console.log "User joined #{ data.username }"
      newPlayer = @add.sprite x, y, 'player'
      @users[data.username] = newPlayer
      @game.world.wrap(@users[data.username], 0, true);

    @socket.on "user left", (data) =>
      console.log "User left #{ data.username }"
      #@remove @users[data.username]
      @users[data.username] = null

    @socket.on "move", (data) =>
      user = @users[data.username]
      if user?
        user.x = data.x;
        user.y = data.y;
        @game.world.wrap(user, 0, true);

  update: ->
    oldx = @player.x;
    oldy = @player.y;
    if @cursors.left.isDown
      @player.x -= 4;
    else if @cursors.right.isDown
      @player.x += 4;

    if @cursors.up.isDown
      @player.y -= 4;
    else if @cursors.down.isDown
      @player.y += 4;
    @game.world.wrap(@player, 0, true);
    if oldx != @player.x || oldy != @player.y
      @socket.emit "move", {username: @username, x: @player.x, y: @player.y}, (data) ->
        console.log "blast sent"

  onInputDown: ->
    @socket.emit "blast", {msg: "Pow!"}, (data) ->
      console.log "blast sent"

  render: ->
    @game.debug.cameraInfo @game.camera, 500, 35
    @game.debug.spriteCoords @player, 32, 32

module.exports = Game
