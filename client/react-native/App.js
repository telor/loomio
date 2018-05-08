const { AppRegistry } = require('react-native')
const Setup           = require('loomio-react-native/dist/setup')
const App             = require('loomio-react-native/dist/app')

Setup()
AppRegistry.registerComponent('main', () => App)
