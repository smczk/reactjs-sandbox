gulp = require 'gulp'
sass = require 'gulp-sass'
babel  = require 'gulp-babel'
rename = require 'gulp-rename'
plumber = require 'gulp-plumber'
watchify = require 'gulp-watchify'

gulp.task 'default', ['build']
gulp.task 'build', ['build:js', 'build:css']

gulp.task 'build:js', ->
  gulp.src('src/**/*.js')
    .pipe plumber()
    .pipe babel()
    .pipe gulp.dest 'lib'

gulp.task 'build:css', ->
  gulp.src('styles/style.scss')
    .pipe plumber()
    .pipe sass()
    .pipe gulp.dest 'public/css'

watching = false
gulp.task 'enable-watch-mode', -> watching = true

gulp.task 'browserify', watchify (watchify) ->
  gulp.src('lib/index.js')
   .pipe watchify
     watch: watching
   .pipe rename 'bundle.js'
   .pipe gulp.dest 'public/js'

gulp.task 'watchify', ['enable-watch-mode', 'browserify']

gulp.task 'watch', ['build', 'enable-watch-mode', 'watchify'], ->
    gulp.watch 'src/**/*.js', ['build:js']
    gulp.watch 'styles/style.scss', ['build:css']
