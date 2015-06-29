browserSync = require 'browser-sync'
gulp = require 'gulp'

gulp.task 'browserSync', ['build'], ->
  browserSync.init ['app/content/**', 'app/scripts/**'],
    server:
      baseDir: 'app'
