gulp    = require 'gulp'
pipe    = require 'gulp-pipe'
rename  = require 'gulp-rename'
cjsx    = require 'gulp-cjsx'
plumber = require 'gulp-plumber'
onError = require './onerror'
paths   = require './paths'

module.exports =
  development: ->
    pipe gulp.src(paths.reactNative.main), [
      plumber(errorHandler: onError),
      cjsx(bare: true)
      rename((path) -> path.extname = '.js')
      gulp.dest(paths.reactNative.dist)
    ]

  production: ->
    pipe gulp.src(paths.reactNative.main), [
      plumber(errorHandler: onError),
      cjsx(bare: true)
      rename((path) -> path.extname = '.js')
      gulp.dest(paths.reactNative.dist)
    ]
