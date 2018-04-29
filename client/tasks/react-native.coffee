gulp    = require 'gulp'
pipe    = require 'gulp-pipe'
rename  = require 'gulp-rename'
cjsx    = require 'gulp-cjsx'
plumber = require 'gulp-plumber'
onError = require './onerror'
paths   = require './paths'

module.exports =
  development: ->
    pipe gulp.src(paths.react.main), [
      plumber(errorHandler: onError),
      cjsx(bare: true)
      rename('App.js')
      gulp.dest(paths.react.dist)
    ]

  production: ->
    pipe gulp.src(paths.react.main), [
      plumber(errorHandler: onError),
      cjsx(bare: true)
      rename('App.js')
      gulp.dest(paths.react.dist)
    ]
