window.app = angular.module('remotelyApp', ['ui', 'ngRoute', 'ngResource'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/:channelId',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        resolve:
          currentUser: (authService) ->
            authService.resolve()
      .otherwise
        redirectTo: '/'
  .run (ChannelsService) ->
    ChannelsService.resolve()
    return

