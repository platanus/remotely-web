app.controller 'MainCtrl', ['$scope', 'Websocket', 'currentUser', 'User', 'UserChannels', 'Channel', 'Message', ($scope, Websocket, currentUser, User, UserChannels, Channel, Message) ->
  $scope.currentUser = currentUser
  $scope.messages = []

  User.query(
      {}
    , (response) ->
      $scope.users = response
    , (response) ->
      console.log response
    )

  UserChannels.query(
    { user_id: $scope.currentUser.user_id }
    , (response) ->
      Websocket.dispatcher.subscribe(channel.label).bind 'channel_message', newMessage for channel in response
      $scope.channels = response
      # We need to change the 0 index by a 'default_channel' value
      $scope.active_channel = response[0]
    , (response) ->
      console.log response
    )

  newMessage = (message) ->
    $scope.$apply ->
      $scope.messages.push { nickname: message.nickname, msg_body: message.msg_body, channel_name: message.channel_name }

  $scope.sendMessage = (event) ->
    if ($scope.message.indexOf "#", 0) == 0
      for channel in $scope.channels
        $scope.active_channel = channel if channel.label == $scope.message.substring(1)
    else
      Websocket.dispatcher.trigger 'new_message', {nickname: $scope.currentUser.nickname, msg_body: $scope.message, channel_name: $scope.active_channel.label }
      Message.save { user_id: $scope.currentUser.user_id, auth_token: $scope.currentUser.auth_token, channel_id: $scope.active_channel.id, body: $scope.message }
    $scope.message = ""

  $scope.joinChannel = (event) ->
    UserChannels.save { user_id: $scope.currentUser.user_id, auth_token: $scope.currentUser.auth_token, label: $scope.join_channel_name, pair: true  }
    , (response) ->
      $scope.active_channel = response
      Websocket.dispatcher.subscribe(response.label).bind 'channel_message', newMessage
    , (response) ->
      console.log response
    $scope.join_channel_name = ""

  $scope.leaveChannel = (event) ->
    Websocket.dispatcher.unsubscribe($scope.leave_channel_name)
    $scope.active_channel = 'coffee-bar'
    $scope.leave_channel_name = ""
  ]
