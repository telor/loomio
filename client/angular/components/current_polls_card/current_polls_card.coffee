Records        = require 'shared/services/records'
AbilityService = require 'shared/services/ability_service'
ModalService   = require 'shared/services/modal_service'

{ applyLoadingFunction } = require 'shared/helpers/apply'

angular.module('loomioApp').directive 'currentPollsCard', ->
  scope: {model: '='}
  templateUrl: 'generated/components/current_polls_card/current_polls_card.html'
  controller: ['$scope', ($scope) ->
    $scope.fetchRecords = ->
      Records.polls.fetchFor($scope.model, status: 'active')
    applyLoadingFunction $scope, 'fetchRecords'
    $scope.fetchRecords()

    $scope.polls = ->
      _.take $scope.model.activePolls(), ($scope.limit or 50)

    $scope.startPoll = ->
      ModalService.open 'PollCommonStartModal', poll: -> Records.polls.build(groupId: $scope.model.id)

    $scope.canStartPoll = ->
      AbilityService.canStartPoll($scope.model.group())
  ]
