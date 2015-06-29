gulp = require 'gulp'

gulp.task 'watch', ['setWatch', 'browserSync'], ->
  gulp.watch 'app/content/styles/less/**', ['less']
  # Note: The browserify task handles js recompiling with watchify
