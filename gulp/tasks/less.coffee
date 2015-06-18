less = require 'gulp-less'
gulp = require 'gulp'
notify = require 'gulp-notify'
handleErrors = require '../util/handleErrors'

gulp.task 'less', ->
  gulp.src './src/less/*.less'
  .pipe less
    paths: './src/less/includes/*.less'
  .on 'error', handleErrors
  .pipe gulp.dest './build'
