const { AppRegistry } = require('react-native')
const Setup           = require('loomio-react-native/dist/setup')
const App             = require('loomio-react-native/dist/app')
require('expo')

Setup()
AppRegistry.registerComponent('main', () => App)
