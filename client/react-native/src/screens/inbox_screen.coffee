React          = require 'react'
{ View, Text } = require 'react-native'
{ inbox }      = require './screen_styles'
InboxService   = require 'shared/services/inbox_service'

module.exports = class InboxScreen extends React.Component
  render: ->
    <View style={inbox}>
      <Text>Unread threads!</Text>
    </View>

  componentDidMount: ->
    InboxService.load().then(console.log)
