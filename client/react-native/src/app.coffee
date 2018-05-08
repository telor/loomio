React    = require 'react'
{
  createDrawerNavigator,
  createStackNavigator
} = require 'react-navigation'


Drawer = createDrawerNavigator(
  Decisions:
    screen: require './screens/decisions_screen'
    navigationOptions: ->
      title: 'Decisions'
  Recent:
    screen: require './screens/recent_screen'
  Inbox:
    screen: require './screens/inbox_screen'
,
  initialRouteName: 'Recent'
)

RootStack = createStackNavigator(
  Drawer: { screen: Drawer }
,
  headerMode: 'float'
  navigationOptions: ->
    headerStyle:
      backgroundColor: '#FFA726'
    title: 'Loomio'
    headerTintColor: 'white'
)

module.exports = class Loomio extends React.Component
  render: -> <RootStack />
