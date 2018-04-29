LmoUrlService = require 'shared/services/lmo_url_service.coffee'
setupRouting  = require 'react-native/app/routes.coffee'

module.exports =
  setupReactNative: ->
    setupNavigator()
    setupRouting()

    module.exports = Router()

setupNavigator = ->
  LmoUrlService.setGoToMethod = (current, next, opts = {})->
    current.props.navigation.navigate(next, opts)
