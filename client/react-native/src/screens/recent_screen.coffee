React          = require 'react'
{
  View, Text, FlatList
} = require 'react-native'
{ recent }  = require './screen_styles'

Records            = require 'shared/services/records'
RecordLoader       = require 'shared/services/record_loader'

{ dashboardViews } = require 'shared/helpers/discussion'

module.exports = class RecentScreen extends React.Component
  constructor: ->
    @state =
      loader: new RecordLoader
        collection: 'discussions'
        params: {per: 50}
      discussions: []

  render: ->
    <View style={recent}>
      <Text>Dashboard!</Text>
      <FlatList
        data={@state.discussions}
        renderItem={({item}) => <Text>{item.title}</Text>}
      />
    </View>

  componentDidMount: ->
    @state.loader.fetchRecords().then =>
      @setState(discussions: Records.discussions.collection.data)
