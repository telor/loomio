_ = require 'lodash'

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
      {
        if @state.loaded
          _.compact _.map _.keys(@state.views), (viewName) =>
            view = @state.views[viewName]
            <DiscussionPreviewCollection key={view.name()} view={view} /> if view.any()
        else
          <ActivityIndicator size="large" />
      }
    </View>

  componentDidMount: ->
    @state.loader.fetchRecords().finally =>
      console.log 'loaded!'
      @setState(loaded: true)
