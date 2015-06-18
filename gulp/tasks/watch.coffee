gulp = require 'gulp'

gulp.task 'watch', ['setWatch', 'browserSync'], ->
  gulp.watch 'src/less/**', ['less']
  gulp.watch 'src/assets/**', ['copy']
  # Note: The browserify task handles js recompiling with watchify
