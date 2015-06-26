class Game
  require 'socket.io'
  @player = null
  @cursors = null

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

  update: ->
    if @cursors.left.isDown
      @player.x -= 4;
    else if @cursors.right.isDown
      @player.x += 4;

    if @cursors.up.isDown
      @player.y -= 4;
    else if @cursors.down.isDown
      @player.y += 4;
    @game.world.wrap(@player, 0, true);

  onInputDown: ->
    #@game.state.start 'menu'

  render: ->
    @game.debug.cameraInfo @game.camera, 500, 35
    @game.debug.spriteCoords @player, 32, 32

module.exports = Game
