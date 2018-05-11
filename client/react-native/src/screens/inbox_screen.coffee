React          = require 'react'
{ View, Text } = require 'react-native'
InboxService   = require 'shared/services/inbox_service'

module.exports = class InboxScreen extends React.Component
  render: ->
    <View>
      <Text>Unread threads!</Text>
    </View>

  componentDidMount: ->
    InboxService.load()
