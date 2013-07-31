app.controller 'MainCtrl', ['$scope', 'Websocket', 'authService', 'User', 'UserChannels', ($scope, Websocket, authService, User, UserChannels) ->
  $scope.user = authService.user
  $scope.messages = []
  $scope.active_channel = 'coffee-bar'

  $scope.users = User.query(
      {}
      # Success
    , (response) ->
      $scope.users = response
      # Error
    , (response) ->
    )

  $scope.channels = UserChannels.query(
    # I don't know why I can't do something like this:
    # { user_id: $scope.user.data.user_id }
    # It's probably related to a missing authService callback.
    # Hardcoded user_id to make it work
    { user_id: 1 }
    # Success
    , (response) ->
      $scope.channels = response
      # Error
    , (response) ->
    )

  newMessage = (message) ->
    $scope.$apply ->
     $scope.messages.push { nickname: message.nickname, msg_body: message.msg_body }

  Websocket.dispatcher.subscribe($scope.active_channel).bind 'channel_message', newMessage

  $scope.sendMessage = (event) ->
    Websocket.dispatcher.trigger 'new_message', {nickname: $scope.user.data.nickname, msg_body: $scope.message, channel_name: $scope.active_channel }
    $scope.message = ""

  $scope.joinChannel = (event) ->
    $scope.active_channel = $scope.join_channel_name
    Websocket.dispatcher.subscribe($scope.active_channel).bind 'channel_message', newMessage
    $scope.join_channel_name = ""

  $scope.leaveChannel = (event) ->
    Websocket.dispatcher.unsubscribe($scope.leave_channel_name)
    $scope.active_channel = 'coffee-bar'
    $scope.leave_channel_name = ""
  ]
