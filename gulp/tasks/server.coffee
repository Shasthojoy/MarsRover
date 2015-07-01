gulp = require 'gulp'
exec = require 'gulp-exec'

gulp.task 'server', (cb) ->
  exec 'node app.js', (err, stdout, stderr) ->
    console.log stdout
    console.log stderr
    cb err
  #exec 'mongod', (err, stdout, stderr) ->
  #  console.log stdout
  #  console.log stderr
  #  cb err
