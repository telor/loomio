React          = require 'react'
{ View, Text } = require 'react-native'
{ view, icon, content } = require './preview.styles'
{ timeFromNowInWords }  = require 'shared/helpers/filters'

module.exports = class DiscussionPreview extends React.Component
  render: ->
    <View>
      <View>
        <Text>{@icon()}</Text>
      </View>
      <View>
        <Text>{@props.discussion.title}</Text>
        <Text>{@byline()}</Text>
      </View>
    </View>

  icon: ->
    if @props.discussion.activePoll()
      "Poll"
    else
      "Avatar"


  byline: ->
    [
      @props.discussion.group().name,
      timeFromNowInWords(@props.discussion.lastActivityAt)
    ].join(' · ')
