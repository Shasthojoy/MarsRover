gulp = require 'gulp'
{argv} = require 'yargs'

if argv.production
  gulp.task 'default', ['production']
else
  gulp.task 'default', ['watch']
