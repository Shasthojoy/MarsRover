class DJ
  Phaser = require 'phaser'

  _playlist = [
    {
      key: "ghostsI", songs: [
        'http://archive.org/download/nineinchnails_ghosts_I_IV/01_Ghosts_I.ogg'
      ]
    },# 'http://archive.org/download/nineinchnails_ghosts_I_IV/02_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/03_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/04_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/05_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/06_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/07_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/08_Ghosts_I.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/09_Ghosts_I.ogg']
    {
      key: "ghostsII", songs: [
        'http://archive.org/download/nineinchnails_ghosts_I_IV/10_Ghosts_II.ogg'
      ]
    },# 'http://archive.org/download/nineinchnails_ghosts_I_IV/11_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/12_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/13_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/14_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/15_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/16_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/17_Ghosts_II.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/18_Ghosts_II.ogg']
    {
      key: "ghostsIII", songs: [
        'http://archive.org/download/nineinchnails_ghosts_I_IV/19_Ghosts_III.ogg'
      ]
    },# 'http://archive.org/download/nineinchnails_ghosts_I_IV/20_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/21_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/22_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/23_Ghosts_III.ogg','http://archive.org/download/nineinchnails_ghosts_I_IV/24_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/25_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/26_Ghosts_III.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/27_Ghosts_III.ogg']
    {
      key: "ghostsIV", songs: [
        'http://archive.org/download/nineinchnails_ghosts_I_IV/28_Ghosts_IV.ogg'
      ]
    }# 'http://archive.org/download/nineinchnails_ghosts_I_IV/29_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/30_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/31_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/32_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/33_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/34_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/35_Ghosts_IV.ogg', 'http://archive.org/download/nineinchnails_ghosts_I_IV/36_Ghosts_IV.ogg']
  ]
  _index = 0
  _musicIsLoaded = false
  _musicIsPlaying = false
  _music = null

  start: (game) ->
    _loadMusic game, _index

  next: (game) ->
    _index++
    _loadMusic game, _index

  _playMusic = ->
    if(_musicIsLoaded and !_musicIsPlaying and _music)
      _musicIsPlaying = true
      _music.play()

  _loadMusic = (game, index) ->
    if _playlist[index]?
      item = _playlist[index]
      loader = new Phaser.Loader game
      loader.audio item.key, item.songs
      loader.onFileComplete.addOnce (progress, cacheKey, success, totalLoaded, totalFiles) =>
        _musicIsLoaded = true;
        _music = game.add.audio item.key
        _playMusic()
      loader.start()

module.exports = DJ
