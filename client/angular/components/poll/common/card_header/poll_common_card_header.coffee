AbilityService = require 'shared/services/ability_service'

{ iconFor } = require 'shared/helpers/poll'

angular.module('loomioApp').directive 'pollCommonCardHeader', ->
  scope: {poll: '='}
  templateUrl: 'generated/components/poll/common/card_header/poll_common_card_header.html'
  controller: ['$scope', ($scope) ->

    $scope.icon = ->
      iconFor($scope.poll)
  ]
