app.controller 'MainCtrl', ['$scope', '$rootScope', 'Websocket', ($scope, $rootScope, Websocket) ->
	$scope.messages = []

	$scope.sendMessage = (event) ->
		Websocket.dispatcher.trigger 'new_message', {user_name: 'Andres', msg_body: $scope.message}
		$scope.message = ""

	newMessage = (message) ->
		console.log message.msg_body
		$scope.$apply ->
			$scope.messages.push { user_name: message.user_name, msg_body: message.msg_body }


	Websocket.dispatcher.bind 'new_message', newMessage
]
