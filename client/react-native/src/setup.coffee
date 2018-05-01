LmoUrlService = require 'shared/services/lmo_url_service'

module.exports = ->
  LmoUrlService.setGoToMethod = (current, next, opts = {})->
    current.props.navigation.navigate(next, opts)

  return require('./routes')
