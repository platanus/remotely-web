app.controller 'MainCtrl', ['$scope', '$rootScope', 'Websocket', ($scope, $rootScope, Websocket) ->
	$scope.user = 'Andres'

	$scope.sendMessage = (event) ->
		Websocket.dispatcher.trigger 'new_message', {user_name: 'Andres', msg_body: $scope.message}

	newMessage = (message) ->
		console.log message.msg_body
		$scope.display = message.msg_body
		$scope.apply

	Websocket.dispatcher.bind 'new_message', newMessage

]
