React          = require 'react'
{ View, Text } = require 'react-native'
{ recent }  = require './screen_styles'

module.exports = class RecentScreen extends React.Component
  render: ->
    <View style={recent}>
      <Text>Dashboard!</Text>
    </View>
