React          = require 'react'
{ View, Text } = require 'react-native'
{ group }      = require './screen_styles'

module.exports = class GroupPage extends React.Component
  render: ->
    <View style={group.view}>
      <Text>Group page!</Text>
    </View>
