app.controller 'MainCtrl', ['$scope', 'Websocket', ($scope, Websocket) ->
	$scope.messages = []

	newMessage = (message) ->
		$scope.$apply ->
			$scope.messages.push { user_name: message.user_name, msg_body: message.msg_body }

	$scope.active_channel = 'coffee-bar'
	Websocket.dispatcher.subscribe($scope.active_channel).bind 'channel_message', newMessage

	$scope.sendMessage = (event) ->
		Websocket.dispatcher.trigger 'new_message', {user_name: 'Andres', msg_body: $scope.message, channel_name: $scope.active_channel }
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
