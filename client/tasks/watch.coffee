# watches and reload changes
paths    = require './paths'
gulp     = require 'gulp'

module.exports = ->
  gulp.watch paths.angular.folders.templates, ['angular:haml']
  gulp.watch paths.angular.scss,              ['angular:scss']
  gulp.watch paths.shared.coffee,             ['react-native:bundle:dev']
  gulp.watch paths.reactNative.main,          ['react-native:bundle:dev']
