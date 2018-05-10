React          = require 'react'
{
  View, Text, FlatList
} = require 'react-native'
{ recent }  = require './screen_styles'

Records            = require 'shared/services/records'
RecordLoader       = require 'shared/services/record_loader'

{ dashboardViews } = require 'shared/helpers/discussion'

module.exports = class RecentScreen extends React.Component
  state =
    discussions: []

  render: ->
    <View style={recent}>
      <Text>Dashboard!</Text>
      <FlatList
        data={@state.discussions}
        renderItem={({item}) => <Text>{discussion.item.title}</Text>}
      />
    </View>

  componentDidMount: ->
    loader = new RecordLoader
      collection: 'discussions'
      params:
        filter: @filter
        per: 50
    loader.fetchRecords().then =>
      @setState(loader: loader)
