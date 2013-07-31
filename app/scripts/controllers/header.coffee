app.controller 'HeaderCtrl', ($scope, authService) ->
    # Options for the modal
    $scope.loginModalOpts =
      backdropFade: true
      dialogFade: true

    # Login in and signing up
    $scope.openLoginModal = ->
      $scope.loginModalInit = true
      $scope.$$childHead.loginModalAction = "login"


    # Close callback
    $scope.closeLoginModalCallback = ->
      $scope.loginModalInit = false

    $scope.logout = ->
      if authService.user.email
        authService.resource.logout ->
          authService.user.email = null
          authService.user.name = null

    # The user
    $scope.user = authService.user
