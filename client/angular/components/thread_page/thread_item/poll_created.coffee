Session        = require 'shared/services/session'
AbilityService = require 'shared/services/ability_service'
ModalService   = require 'shared/services/modal_service'
EventBus = require 'shared/services/event_bus'
{ myLastStanceFor }  = require 'shared/helpers/poll'

{ listenForTranslations, listenForReactions } = require 'shared/helpers/listen'

angular.module('loomioApp').directive 'pollCreated', ->
  scope: {eventable: '='}
  restrict: 'E'
  templateUrl: 'generated/components/thread_page/thread_item/poll_created.html'
  replace: true
  controller: ['$scope', ($scope) ->
    $scope.actions = [
    #   name: 'edit_poll'
    #   icon: 'mdi-pencil'
    #   canPerform: -> AbilityService.canEditPoll($scope.eventable)
    #   perform:    -> ModalService.open 'PollCommonEditModal', poll: -> $scope.eventable
    # ,
      name: 'translate_outcome'
      icon: 'mdi-translate'
      canPerform: -> AbilityService.canTranslate($scope.eventable)
      perform:    -> $scope.eventable.translate(Session.user().locale)
    ]

    $scope.buttonPressed = false
    EventBus.listen $scope, 'showResults', ->
      $scope.buttonPressed = true

    $scope.showResults = ->
      $scope.buttonPressed || myLastStanceFor($scope.eventable)? || $scope.eventable.isClosed()

    EventBus.listen $scope, 'stanceSaved', ->
      EventBus.broadcast $scope, 'refreshStance'


    listenForReactions $scope, $scope.eventable
    listenForTranslations $scope
  ]
