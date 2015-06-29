less = require 'gulp-less'
gulp = require 'gulp'
notify = require 'gulp-notify'
handleErrors = require '../util/handleErrors'

gulp.task 'less', ->
  gulp.src './app/content/styles/less/*.less'
  .pipe less
    paths: './app/content/styles/less/includes/*.less'
  .on 'error', handleErrors
  .pipe gulp.dest './app/content/styles'
