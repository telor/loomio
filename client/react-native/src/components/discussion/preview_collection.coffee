React = require 'react'
{ View, Text, FlatList } = require 'react-native'
DiscussionPreview = require './preview'

module.exports = class DiscussionPreviewCollection extends React.Component
  render: ->
    <View>
      <View>
        <Text>{@props.view.name}</Text>
      </View>
      <View>
        <FlatList
          data={@props.view.threads()}
          renderItem={({item}) -> <DiscussionPreview discussion={item} />}
        />
      </View>
    </View>
