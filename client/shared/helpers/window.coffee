require('promise.prototype.finally').shim()                   # polyfill for Promise.finally
require 'whatwg-fetch'                                        # polyfill for Fetch API

PromisePolyfill = require 'promise-polyfill'
bowser          = require 'bowser'
window.bowser   = bowser

AppConfig       = require 'shared/services/app_config'

# a series of helpers related to the current browser window, such as the viewport size
# or printing. Hopefully we can pool all window-related functionality here, and
# then allow for an alternate implementation for when 'window' may not exist
module.exports =
  unsupportedBrowser: ->
    (bowser.safari and bowser.version < 9) or (bowser.ie and bowser.version < 11)

  deprecatedBrowser: ->
    bowser.msie and parseInt(bowser.version) <= 11

  exportGlobals: ->
    window.Promise = window.Promise or PromisePolyfill # polyfill for Promise object
    window.moment = require 'moment'
    window._      = require 'lodash'
    _.extend window._, require 'shared/helpers/lodash_ext'

  initServiceWorker: ->
    if document.location.protocol.match(/https/) && navigator.serviceWorker?
      navigator.serviceWorker.register(document.location.origin + '/service-worker.js', scope: './')

  triggerResize: (delay) ->
    setTimeout ->
      window.dispatchEvent(new window.Event('resize'))
    , delay if window.Event?

  setCurrentComponent: (options) ->
    title = _.trunc options.title or I18n.t(options.titleKey), 300
    document.querySelector('title').text = _.compact([title, AppConfig.theme.site_name]).join(' | ')

    AppConfig.currentGroup = options.group
    IntercomService.updateWithGroup(AppConfig.currentGroup)
    ModalService.forceSignIn() if shouldForceSignIn(options)

    scrollTo(options.scrollTo or 'h1') unless options.skipScroll
    updateCover()

  print:                      -> window.print()
  is2x:                       -> window.devicePixelRatio >= 2
  viewportSize:               -> viewportSize()
  hardReload: (path)          -> hardReload(path)
  scrollTo: (target, options) -> scrollTo(target, options)
  updateCover:                -> updateCover()

hardReload = (path) ->
  if path
    window.location.href = path
  else
    window.location.reload()

viewportSize = ->
  if window.innerWidth < 480
    'small'
  else if window.innerWidth < 992
    'medium'
  else if window.innerWidth < 1280
    'large'
  else
    'extralarge'

shouldForceSignIn = (options = {}) ->
  return false if AbilityService.isLoggedIn() && AppConfig.pendingIdentity.identity_type != "loomio"
  return true  if AppConfig.pendingIdentity.identity_type?
  switch options.page
    when 'emailSettingsPage' then !Session.user().restricted?
    when 'dashboardPage',      \
         'inboxPage',          \
         'profilePage',        \
         'authorizedAppsPage', \
         'registeredAppsPage', \
         'registeredAppPage',  \
         'pollsPage',          \
         'startPollPage',      \
         'upgradePage',        \
         'startGroupPage' then true

updateCover = ->
  $cover = document.querySelector('.lmo-main-background')
  if AppConfig.currentGroup
    url = AppConfig.currentGroup.coverUrl(viewportSize())
    $cover.setAttribute('style', "background-image: url(#{url})")
  else
    $cover.removeAttribute('style')

scrollTo = (target, options = {}) ->
  setTimeout ->
    ScrollService.scrollTo(
      document.querySelector(target),
      document.querySelector(options.container or '.lmo-main-content'),
      options
    )
