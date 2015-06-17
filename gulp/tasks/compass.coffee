compass      = require 'gulp-compass'
gulp         = require 'gulp'
notify       = require 'gulp-notify'
handleErrors = require '../util/handleErrors'

gulp.task 'compass', ->
  gulp.src './src/sass/*.scss'
  .pipe compass
    config_file: 'compassassin.rb'
    css: 'build'
    sass: 'src/sass'
  .on 'error', handleErrors
