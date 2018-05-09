LmoUrlService = require 'shared/services/lmo_url_service'
{ KeepAwake } = require 'expo'
_             = require 'lodash'

module.exports = ->
  KeepAwake() if __DEV__

  global._ = _

  LmoUrlService.setGoToMethod = (current, next, opts = {}) ->
    current.props.navigation.navigate(next, opts)
