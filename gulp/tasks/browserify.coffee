# browserify task
# ---------------
# Bundle javascripty things with browserify!
#

browserify   = require 'browserify'
bundleLogger = require '../util/bundleLogger'
gulp         = require 'gulp'
handleErrors = require '../util/handleErrors'
source       = require 'vinyl-source-stream'

gulp.task 'browserify', ->
  bundler = browserify
    # Required browserify args
    cache: {}
    packageCache: {}
    fullPaths: true
    # Specify the entry point of your app
    entries: ['./app/scripts/game/main.coffee']
    # Add file extentions to make optional in your requires
    extensions: ['.coffee']
    # Enable source maps!
    debug: true

  bundle = ->
    # Log when bundling starts
    bundleLogger.start()

    bundler
      .bundle()
      # Report compile errors
      .on 'error', handleErrors
      # Use vinyl-source-stream to make the
      # stream gulp compatible. Specifiy the
      # desired output filename here.
      .pipe source 'app.js'
      # Specify the output destination
      .pipe gulp.dest './app/scripts'
      # Log when bundling completes!
      .on 'end', bundleLogger.end

  bundle()
