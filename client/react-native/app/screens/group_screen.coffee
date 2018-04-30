React          = require 'react'
{ View, Text } = require 'react-native'
styles         = require 'react-native/app/styles'

module.exports = class GroupPage extends React.Component
  render: ->
    <View style={styles.container}>
      <Text>Group page!</Text>
    </View>
