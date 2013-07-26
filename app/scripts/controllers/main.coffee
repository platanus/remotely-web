app.controller 'MainCtrl', ['$scope', 'Websocket', 'authService', ($scope, Websocket, authService) ->
	$scope.messages = []
	$scope.user = authService.user

	newMessage = (message) ->
		$scope.$apply ->
			$scope.messages.push { nickname: message.nickname, msg_body: message.msg_body }

	$scope.active_channel = 'coffee-bar'
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
