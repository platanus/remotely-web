app.controller 'MainCtrl', ['$scope', 'Websocket', 'authService', 'User', 'UserChannels', 'Channel', 'Message', ($scope, Websocket, authService, User, UserChannels, Channel, Message) ->
  $scope.user = authService.user
  $scope.messages = []
  $scope.active_channel = 'coffee-bar'

  User.query(
      {}
    , (response) ->
      $scope.users = response
    , (response) ->
      console.log response
    )

  UserChannels.query(
    # I don't know why I can't do something like this:
    # { user_id: $scope.user.data.user_id }
    # It's probably related to a missing authService callback.
    # Hardcoded user_id to make it work
    { user_id: 1 }
    , (response) ->
      Websocket.dispatcher.subscribe(channel.label).bind 'channel_message', newMessage for channel in response
      $scope.channels = response
    , (response) ->
      console.log response
    )

  newMessage = (message) ->
    $scope.$apply ->
      $scope.messages.push { nickname: message.nickname, msg_body: message.msg_body, channel_name: message.channel_name }

  $scope.sendMessage = (event) ->
    if ($scope.message.indexOf "#", 0) == 0
      $scope.active_channel = $scope.message.substring(1)
    else
      Websocket.dispatcher.trigger 'new_message', {nickname: $scope.user.data.nickname, msg_body: $scope.message, channel_name: $scope.active_channel }
      Message.save { user_id: 1, channel_id: 1, body: $scope.message }
    $scope.message = ""

  $scope.joinChannel = (event) ->
    # FIXME: we need to send the auth token
    UserChannels.save { user_id: 6, label: $scope.join_channel_name }
    , (response) ->
      $scope.active_channel = response.label
      Websocket.dispatcher.subscribe(response.label).bind 'channel_message', newMessage
    , (response) ->
      console.log response
    $scope.join_channel_name = ""

  $scope.leaveChannel = (event) ->
    Websocket.dispatcher.unsubscribe($scope.leave_channel_name)
    $scope.active_channel = 'coffee-bar'
    $scope.leave_channel_name = ""
  ]
