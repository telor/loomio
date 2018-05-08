React                     = require 'react'
{
  createDrawerNavigator,
  createStackNavigator
} = require 'react-navigation'


Drawer = createDrawerNavigator(
  Decisions:   { screen: require './screens/decisions_screen' }
  Recent:      { screen: require './screens/recent_screen' }
  Inbox:       { screen: require './screens/inbox_screen' }
)

RootStack = createStackNavigator(
  Drawer: { screen: Drawer }
,
  headerMode: 'float'
  navigationOptions: ->
    headerStyle:
      backgroundColor: '#4C3E54'
    title: 'Welcome!'
    headerTintColor: 'white'
)

module.exports = class Loomio extends React.Component
  render: -> <RootStack />
