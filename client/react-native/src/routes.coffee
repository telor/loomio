{ StackNavigator } = require 'react-navigation'

module.exports = ->
  StackNavigator(
    Dashboard: { screen: require './screens/group_screen' }
    Group:     { screen: require './screens/dashboard_screen' }
  ,
    initialRouteName: 'Dashboard'
  )
