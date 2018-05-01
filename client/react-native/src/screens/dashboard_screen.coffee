React          = require 'react'
{ View, Text } = require 'react-native'
{ dashboard }  = require './screen_styles'

module.exports = class DashboardPage extends React.Component
  render: ->
    <View style={dashboard.view}>
      <Text>Dashboard!</Text>
    </View>
