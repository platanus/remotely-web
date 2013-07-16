app.controller 'UsersCtrl', ['$scope', 'User', ($scope, User) ->
  $scope.users = User.query()
]
