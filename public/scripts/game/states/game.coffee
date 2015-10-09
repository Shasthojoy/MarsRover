class Game
  io = require 'socket.io'
  @player = null
  @slaveplayer = null
  @cursors = null
  @socket = null

  create: ->
    @game.world.setBounds 0, 0, 1041, 642
    x = @game.width / 2
    y = @game.height / 2
    @add.sprite 0, 0, 'bg'
    @player = @add.sprite x, y, 'player'
    @slaveplayer = @add.sprite x, y, 'player'
    @game.camera.follow @player
    #@player.anchor.setTo 0.5, 0.5
    @cursors = @game.input.keyboard.createCursorKeys()
    @input.onDown.add @onInputDown, this
    @socket = io.connect('http://127.0.0.1:3000/')
    @socket.on "blast", (data) =>
      coords = data.msg.split("|")
      if coords.length > 1
        @slaveplayer.x = coords[0];
        @slaveplayer.y = coords[1];
        @game.world.wrap(@slaveplayer, 0, true);

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
      @socket.emit "blast", {msg: @player.x + "|" + @player.y}, (data) ->
        console.log "blast sent"

  onInputDown: ->
    @socket.emit "blast", {msg: "Pow!"}, (data) ->
      console.log "blast sent"

  render: ->
    @game.debug.cameraInfo @game.camera, 500, 35
    @game.debug.spriteCoords @player, 32, 32

module.exports = Game