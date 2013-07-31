app.controller 'SignupCtrl', ($scope, authService) ->
    $scope.registerUser = ->

      # Reset the alerts
      $scope.alert = null
      userData = user: $scope.regUser
      authService.resource.register userData, ((e) ->

      #authService.cookies.setToken(e.data['auth_token']);
      ), (e) ->
        if angular.isObject(e.data) and e.data.info.email.length
          if e.data.info.email[0] is 'has already been taken'

            # The email is already taken
            $scope.alert = 'email'
          else
            $scope.alert = 'other'
        else
          $scope.alert = 'other'

