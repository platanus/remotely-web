window.app = angular.module('remotelyAngularApp', ['ui', 'ngResource'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/users',
        templateUrl: 'views/user.html',
        controller: 'UsersCtrl'
      .otherwise
        redirectTo: '/'
  .run (authService) ->
    authService.resource.status {}, (e) ->
      authService.user.data = e
