app.factory 'Websocket', () ->
	{
		dispatcher: new WebSocketRails('localhost:3000/websocket', true)
	}
