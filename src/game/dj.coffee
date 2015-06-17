class DJ
  Phaser = require 'phaser'

  _playlist = {
    ghostsI: ['http://archive.org/download/nineinchnails_ghosts_I_IV/01_Ghosts_I.ogg']#, 'http://archive.org/download/nineinchnails_ghosts_I_IV/02_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/03_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/04_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/05_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/06_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/07_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/08_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/09_Ghosts_I.ogg']
    ghostsII: ['http://archive.org/download/nineinchnails_ghosts_I_IV/10_Ghosts_II.ogg']#, 'http://archive.org/download/nineinchnails_ghosts_I_IV/11_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/12_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/13_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/14_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/15_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/16_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/17_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/18_Ghosts_II.ogg']
    ghostsIII: ['http://archive.org/download/nineinchnails_ghosts_I_IV/19_Ghosts_III.ogg']#, 'http://archive.org/download/nineinchnails_ghosts_I_IV/20_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/21_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/22_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/23_Ghosts_III.ogg','http://archive.org/download/nineinchnails_ghosts_I_IV/24_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/25_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/26_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/27_Ghosts_III.ogg']
    ghostsIV: ['http://archive.org/download/nineinchnails_ghosts_I_IV/28_Ghosts_IV.ogg']#, 'http://archive.org/download/nineinchnails_ghosts_I_IV/29_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/30_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/31_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/32_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/33_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/34_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/35_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/36_Ghosts_IV.ogg']
  }
  _musicIsLoaded = false
  _musicIsPlaying = false
  _music = null

  constructor: (game) ->
    #@preloadMusic game, 'ghostsI'
    #@loadMusic game, 'ghostsI'

  playMusic: ->
    if(_musicIsLoaded and !_musicIsPlaying and _music)
      _musicIsPlaying = true
      _music.play()

  loadMusic: (game, song) ->
    if song of _playlist
      _musicIsLoaded = true;
      _music = game.add.audio song

  preloadMusic: (game, song)->
    if song of _playlist
      loader = new Phaser.Loader game
      loader.audio song, _playlist[song]
      loader.onFileComplete.addOnce (progress, cacheKey, success, totalLoaded, totalFiles) =>
        @loadMusic game, song
        @playMusic()
      loader.start()

module.exports = DJ
