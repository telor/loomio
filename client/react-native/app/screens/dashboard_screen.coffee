React          = require 'react'
{ View, Text } = require 'react-native'
styles         = require 'react-native/app/styles'

module.exports = class DashboardPage extends React.Component
  render: ->
    <View style={styles.container}>
      <Text>Dashboard!</Text>
    </View>
