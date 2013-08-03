window.app = angular.module('remotelyAngularApp', ['ui', 'ngResource'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        resolve:
          currentUser: (authService) ->
            authService.resolve()
      .otherwise
        redirectTo: '/'
