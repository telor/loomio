React          = require 'react'
{ View, Text } = require 'react-native'
{ decisions }  = require './screen_styles'

module.exports = class DecisionsScreen extends React.Component
  render: ->
    <View style={decisions}>
      <Text>Decisions!</Text>
    </View>
