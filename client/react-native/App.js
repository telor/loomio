require('coffeescript/register')
const expo = require('expo')

if (__DEV__) { expo.KeepAwake() }

module.exports = require('react-native/app/setup.coffee').setupReactNative()
