{ StackNavigator } = require 'react-navigator'

module.exports = ->
  StackNavigator
    Dashboard: { screen: require 'react-native/pages/group_screen.coffee' }
    Group:     { screen: require 'react-native/pages/dashboard_screen.coffee' }
  ,
    initialRouteName: 'Dashboard'
