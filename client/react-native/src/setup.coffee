LmoUrlService = require 'shared/services/lmo_url_service'
{ KeepAwake } = require 'expo'

module.exports = ->
  KeepAwake() if __DEV__

  LmoUrlService.setGoToMethod = (current, next, opts = {}) ->
    current.props.navigation.navigate(next, opts)
