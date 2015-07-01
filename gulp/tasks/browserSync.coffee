browserSync = require 'browser-sync'
gulp = require 'gulp'

gulp.task 'browserSync', ['build'], ->
  browserSync.init
    proxy: 'http://localhost:3000',
    files: ['app/content/**', 'app/scripts/**']
    browser: 'google chrome'
