LmoUrlService = require 'shared/services/lmo_url_service'
AppConfig     = require 'shared/record_store/restful_client'
{ KeepAwake } = require 'expo'

module.exports = ->
  KeepAwake() if __DEV__

  AppConfig.apiHost = 'http://localhost:3000'

  LmoUrlService.setGoToMethod = (current, next, opts = {}) ->
    current.props.navigation.navigate(next, opts)
