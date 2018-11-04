# Session        = require 'shared/services/session'
# EventBus       = require 'shared/services/event_bus'
# AbilityService = require 'shared/services/ability_service'
# LmoUrlService  = require 'shared/services/lmo_url_service'
# FlashService   = require 'shared/services/flash_service'
# ModalService   = require 'shared/services/modal_service'
#
# { listenForTranslations, listenForReactions } = require 'shared/helpers/listen'
Records       = require 'shared/services/records'
LmoUrlService = require 'shared/services/lmo_url_service'

{ applyLoadingFunction } = require 'shared/helpers/apply'

angular.module('loomioApp').directive 'timelineCard', ['$rootScope', ($rootScope) ->
  scope: {discussion: '='}
  restrict: 'E'
  templateUrl: 'generated/components/thread_page/timeline_card/timeline_card.html'
  replace: false
  controller: ['$scope', ($scope) ->
    kinds = ['poll_created', 'outcome_created']

    $scope.fetchRecords = ->
      # fetch events for this discussion with poll created or outcome created
      Records.events.fetchByDiscussion($scope.discussion.key, {kind_in: kinds})

    applyLoadingFunction($scope, 'fetchRecords')

    $scope.fetchRecords()

    $scope.events = ->
      Records.events.collection.chain().
        find(discussionId: $scope.discussion.id).
        find(kind: {$in: kinds}).data() #sort too

  ]
]
