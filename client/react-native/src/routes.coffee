React              = require 'react'
{ StackNavigator } = require 'react-navigation'

Routes = StackNavigator(
  Dashboard: { screen: require './screens/group_screen' }
  Group:     { screen: require './screens/dashboard_screen' }
  ,
  initialRouteName: 'Dashboard'
)

module.exports = class Loomio extends React.Component
  render: -> <Routes />
