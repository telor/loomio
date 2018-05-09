React    = require 'react'
{ Icon } = require 'react-native-elements'
{
  createDrawerNavigator,
  createStackNavigator
} = require 'react-navigation'

Drawer = createDrawerNavigator(
  Decisions:
    screen: require './screens/decisions_screen'
    navigationOptions:
      drawerIcon: -> <Icon name="thumbs-up-down" type="material-community" />
      title: 'Decisions'
  Recent:
    screen: require './screens/recent_screen'
    navigationOptions:
      drawerIcon: -> <Icon name="forum" type="material-community" />
      title: 'Dashboard'
  Inbox:
    screen: require './screens/inbox_screen'
    navigationOptions:
      drawerIcon: -> <Icon name="inbox" type="material-community" />
      title: 'Inbox'
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
