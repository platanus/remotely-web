app.controller 'MainCtrl', ['$scope', 'Websocket', 'authService', 'User', 'UserChannels', 'Channel', ($scope, Websocket, authService, User, UserChannels, Channel) ->
  $scope.user = authService.user
  $scope.messages = []
  $scope.active_channel = 'coffee-bar'

  User.query(
      {}
      # Success
    , (response) ->
      $scope.users = response
      # Error
    , (response) ->
    )

  UserChannels.query(
    # I don't know why I can't do something like this:
    # { user_id: $scope.user.data.user_id }
    # It's probably related to a missing authService callback.
    # Hardcoded user_id to make it work
    { user_id: 1 }
    # Success
    , (response) ->
      Websocket.dispatcher.subscribe(channel.label).bind 'channel_message', newMessage for channel in response
      $scope.channels = response
      # Error
    , (response) ->
    )

  newMessage = (message) ->
    $scope.$apply ->
      $scope.messages.push { nickname: message.nickname, msg_body: message.msg_body, channel_name: message.channel_name }

  $scope.sendMessage = (event) ->
    if ($scope.message.indexOf "#", 0) == 0
      $scope.active_channel = $scope.message.substring(1)
    else
      Websocket.dispatcher.trigger 'new_message', {nickname: $scope.user.data.nickname, msg_body: $scope.message, channel_name: $scope.active_channel }
    $scope.message = ""

  $scope.joinChannel = (event) ->
    $scope.active_channel = $scope.join_channel_name
    $scope.join_channel_name = ""

  $scope.leaveChannel = (event) ->
    Websocket.dispatcher.unsubscribe($scope.leave_channel_name)
    $scope.active_channel = 'coffee-bar'
    $scope.leave_channel_name = ""
  ]
