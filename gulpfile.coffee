#!/usr/bin/env coffee

###
  REQUIRE
###
echo = console.log
{join} = require 'path'
#{argv} = require 'yargs'

gulp = require 'gulp'
clean = require 'gulp-clean'
gulpFilter = require 'gulp-filter'
jade = require 'gulp-jade'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
browserSync = require 'browser-sync'
runSequence = require 'run-sequence'
ghpages = require 'gulp-gh-pages'
frep = require 'gulp-frep'
gulpif = require 'gulp-if'

###
  PATH
###
srcpath = join __dirname, './src'
dstpath = join __dirname, './dist'

isPrd = false

patterns = [
  {
    pattern: '../bower_components/bootstrap/dist/css/bootstrap.css'
    replacement: 'http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css'
  }
  {
    pattern: '../bower_components/jquery/dist/jquery.js'
    replacement: 'http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js'
  }
  {
    pattern: '../bower_components/angular/angular.js'
    replacement: 'http://cdn.bootcss.com/angular.js/1.3.0-beta.8/angular.min.js'
  }
  {
    pattern: '../bower_components/angular-animate/angular-animate.js'
    replacement: 'http://cdn.bootcss.com/angular.js/1.3.0-beta.8/angular-animate.min.js'
  }
  {
    pattern: '../bower_components/angular-route/angular-route.js'
    replacement: 'http://cdn.bootcss.com/angular.js/1.3.0-beta.8/angular-route.min.js'
  }
  {
    pattern: '../bower_components/angular-resource/angular-resource.js'
    replacement: 'http://cdn.bootcss.com/angular.js/1.3.0-beta.7/angular-resource.min.js'
  }
]

###
  BUILD TASKS
###
gulp.task 'clean', ->
  gulp
    .src dstpath,
      read: false
    .pipe clean()

gulp.task 'build', ->

  jadeFilter = gulpFilter ['**/*.jade']
  stylusFilter = gulpFilter ['**/*.styl']
  coffeeFilter = gulpFilter ['**/*.coffee']

  gulp
    .src "#{srcpath}/**/*"
    .pipe jadeFilter
    .pipe jade
      locals: {}
    .pipe gulpif isPrd, frep patterns
    .pipe jadeFilter.restore()
    .pipe stylusFilter
    .pipe stylus()
    .pipe stylusFilter.restore()
    .pipe coffeeFilter
    .pipe coffee
      bare: true
    .pipe coffeeFilter.restore()
    .pipe browserSync.reload stream:true
    .pipe gulp.dest dstpath

gulp.task 'browsersync', ->
  browserSync
    server:
      baseDir: './'
    port: 9000
    index: 'index.html'
    startPath: 'dist'
    watchTask: true

gulp.task 'watch', ->
  gulp.watch "#{srcpath}/**/*", ['build']

gulp.task 'ghpages', ->
  gulp
  .src "#{dstpath}/**/*"
  .pipe ghpages()

######

gulp.task 'dev', ->
  runSequence 'clean', 'build', 'watch', 'browsersync'

gulp.task 'prd', ->
  isPrd = true
  runSequence 'clean', 'build', 'watch', 'browsersync'

gulp.task 'default', ->
  runSequence 'clean', 'build'

gulp.task 'deploy', ->
  isPrd = true
  runSequence 'clean', 'build', 'ghpages'
