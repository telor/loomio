if (__DEV__) { require('expo').KeepAwake() }

require('loomio-react-native/dist/setup').setup()

module.exports = require('loomio-react-native/dist/routes')
