gulp = require 'gulp'

gulp.task 'production', [
  'browserify'
  'less'
  'images'
  'copy'
]
