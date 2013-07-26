'use strict'

angular.module('remotelyAngularApp')
  .controller 'LoginCtrl', ($scope, authService) ->
    $scope.loginUser = ->

      # Reset the alerts
      $scope.alert = null
      userData = $scope.logUser
      authService.resource.login userData, ((e) ->
        $scope.$parent.loginModalInit = false
        authService.user.data = e
      ), ->

        # Some error
        $scope.alert = 'other'

