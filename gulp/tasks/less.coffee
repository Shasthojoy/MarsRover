less = require 'gulp-less'
gulp = require 'gulp'
notify = require 'gulp-notify'
handleErrors = require '../util/handleErrors'

gulp.task 'less', ->
  gulp.src './public/styles/less/*.less'
  .pipe less
    paths: './public/styles/less/includes/*.less'
  .on 'error', handleErrors
  .pipe gulp.dest './public/styles'
