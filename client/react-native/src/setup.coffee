LmoUrlService = require 'shared/services/lmo_url_service'

module.exports =
  setup: ->
    LmoUrlService.setGoToMethod = (current, next, opts = {})->
      current.props.navigation.navigate(next, opts)
