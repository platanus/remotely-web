window.app = angular.module('remotelyAngularApp', ['ui'])
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