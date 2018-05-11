React = require 'react'
{ View, Text, ActivityIndicator } = require 'react-native'
DiscussionPreviewCollection = require '../components/discussion/preview_collection'

Records = require 'shared/services/records'
RecordLoader = require 'shared/services/record_loader'

{ dashboardViews } = require 'shared/helpers/discussion'

module.exports = class RecentScreen extends React.Component
  constructor: ->
    @state =
      loader: new RecordLoader
        collection: 'discussions'
        params: {per: 50}
      views: dashboardViews()
      loaded: false

  render: ->
    <View>
      <Text>Dashboard!</Text>
      {<ActivityIndicator size="large" /> if !@state.loaded}
      <DiscussionPreviewCollection view={@state.views.proposals} />
      <DiscussionPreviewCollection view={@state.views.today} />
      <DiscussionPreviewCollection view={@state.views.yesterday} />
      <DiscussionPreviewCollection view={@state.views.thisweek} />
      <DiscussionPreviewCollection view={@state.views.thismonth} />
      <DiscussionPreviewCollection view={@state.views.older} />
    </View>

  willMountComponent: ->
    @state.loader.fetchRecords().then(console.log).finally ->
      @setState(loaded: true)
