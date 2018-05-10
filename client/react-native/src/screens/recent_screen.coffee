React          = require 'react'
{ View, Text } = require 'react-native'
{ recent }  = require './screen_styles'

RecordLoader       = require 'shared/services/record_loader'
{ dashboardViews } = require 'shared/helpers/discussion'

module.exports = class RecentScreen extends React.Component
  render: ->
    <View style={recent}>
      <Text>Dashboard!</Text>
    </View>

  componentDidMount: ->
    @loader = new RecordLoader
      collection: 'discussions'
      path: 'dashboard'
      params:
        filter: @filter
        per: 50
    @loader.fetchRecords().then => @dashboardLoaded = true
