gulp = require 'gulp'
nodemon = require 'gulp-nodemon'

gulp.task 'nodemon', (cb) ->
	nodemon
		script: 'app.coffee',
		ext: 'js coffee'
	.once 'start', cb
