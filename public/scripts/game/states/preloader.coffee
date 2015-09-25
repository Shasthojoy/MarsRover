class Preloader

  @asset = null
  @ready = false

  preload: ->
    @asset = @add.sprite(320, 240, 'preloader')
    @asset.anchor.setTo 0.5, 0.5
    @load.onLoadComplete.addOnce @onLoadComplete, this
    @load.setPreloadSprite @asset
    @load.image 'player', 'content/images/player.png'
    @load.bitmapFont 'minecraftia', 'content/fonts/minecraftia.png', 'content/fonts/minecraftia.xml'
    @load.image 'bg', 'content/images/mars-bg.jpg'
  create: ->
    @asset.cropEnabled = false

  update: ->
    @game.state.start 'menu' unless not @ready

  onLoadComplete: ->
    @ready = true

module.exports = Preloader
