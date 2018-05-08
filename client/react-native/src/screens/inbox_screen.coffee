React          = require 'react'
{ View, Text } = require 'react-native'
{ inbox }      = require './screen_styles'

module.exports = class InboxScreen extends React.Component
  render: ->
    <View style={inbox}>
      <Text>Unread threads!</Text>
    </View>
