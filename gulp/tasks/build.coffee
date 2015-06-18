gulp = require 'gulp'

gulp.task 'build', [
  'browserifyAndWatch'
  'less'
  'copy'
]
