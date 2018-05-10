AppConfig          = require 'shared/services/app_config'
Records            = require 'shared/services/records'
Session            = require 'shared/services/session'
EventBus           = require 'shared/services/event_bus'
AbilityService     = require 'shared/services/ability_service'
RecordLoader       = require 'shared/services/record_loader'
ThreadQueryService = require 'shared/services/thread_query_service'
ModalService       = require 'shared/services/modal_service'

{ dashboardViews } = require 'shared/helpers/discussion'

$controller = ($rootScope, $routeParams, $mdMedia) ->

  @filter = $routeParams.filter || 'hide_muted'

  titleKey = =>
    if @filter == 'show_muted'
      'dashboard_page.filtering.muted'
    else
      'dashboard_page.filtering.all'

  EventBus.broadcast $rootScope, 'currentComponent',
    titleKey: titleKey()
    page: 'dashboardPage'
    filter: $routeParams.filter

  viewName = (name) =>
    if @filter == 'show_muted'
      "dashboard#{_.capitalize(name)}Muted"
    else
      "dashboard#{_.capitalize(name)}"

  filters = (filters) =>
    ['only_threads_in_my_groups', 'show_opened', @filter].concat(filters)

  @views = dashboardViews()
  @viewNames = _.keys(@views)
  @loadingViewNames = _.take @viewNames, 3

  @loader = new RecordLoader
    collection: 'discussions'
    path: 'dashboard'
    params:
      filter: @filter
      per: 50
  @loader.fetchRecords().then => @dashboardLoaded = true

  @noGroups        = -> !Session.user().hasAnyGroups()
  @promptStart     = -> !Session.user().hasAnyGroups() && AbilityService.canStartGroups()
  @noThreads       = -> _.all @views, (view) -> !view.any()
  @startGroup      = -> ModalService.open 'GroupModal', group: -> Records.groups.build()
  @userHasMuted    = -> Session.user().hasExperienced("mutingThread")
  @showLargeImage  = -> $mdMedia("gt-sm")

  return

$controller.$inject = ['$rootScope', '$routeParams', '$mdMedia']
angular.module('loomioApp').controller 'DashboardPageController', $controller
