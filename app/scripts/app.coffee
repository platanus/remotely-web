window.app = angular.module('remotelyApp', ['ngResource'])
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