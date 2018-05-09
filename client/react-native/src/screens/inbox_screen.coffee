React          = require 'react'
{ View, Text } = require 'react-native'
{ inbox }      = require './screen_styles'
InboxService   = require 'shared/services/records'

module.exports = class InboxScreen extends React.Component
  render: ->
    <View style={inbox}>
      <Text>Unread threads!</Text>
    </View>

  willMountComponent: ->
    InboxService.load()
